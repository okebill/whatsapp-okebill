const mysql = require('mysql2/promise');
const bcrypt = require('bcryptjs');
const crypto = require('crypto');
const dbConfig = require('../config/database');

class UserRegistration {
  constructor() {
    this.connection = null;
  }

  async getConnection() {
    if (!this.connection) {
      this.connection = await mysql.createConnection(dbConfig);
    }
    return this.connection;
  }

  // Generate unique API key for user
  generateApiKey() {
    return crypto.randomBytes(32).toString('hex');
  }

  // Calculate trial end date
  getTrialEndDate() {
    const date = new Date();
    date.setDate(date.getDate() + 7); // 7 days trial
    return date.toISOString().split('T')[0];
  }

  // Register new user
  async registerUser(userData) {
    const connection = await this.getConnection();
    
    try {
      const { username, password, email, phone_number, full_name } = userData;
      
      // Validate required fields
      if (!username || !password || !email) {
        throw new Error('Username, password, dan email wajib diisi');
      }

      // Check if username already exists
      const [existingUser] = await connection.execute(
        'SELECT id FROM users WHERE username = ?',
        [username]
      );

      if (existingUser.length > 0) {
        throw new Error('Username sudah digunakan');
      }

      // Check if email already exists
      const [existingEmail] = await connection.execute(
        'SELECT id FROM users WHERE email = ?',
        [email]
      );

      if (existingEmail.length > 0) {
        throw new Error('Email sudah digunakan');
      }

      // Hash password
      const hashedPassword = await bcrypt.hash(password, 10);
      
      // Generate API key
      const apiKey = this.generateApiKey();
      
      // Get trial end date
      const trialEndDate = this.getTrialEndDate();

      // Insert new user
      const [result] = await connection.execute(
        `INSERT INTO users (
          username, password, email, phone_number, full_name, api_key, 
          role, is_active, payment_status, trial_ends_at, created_date
        ) VALUES (?, ?, ?, ?, ?, ?, 'user', 0, 'trial', ?, NOW())`,
        [username, hashedPassword, email, phone_number, full_name, apiKey, trialEndDate]
      );

      // Create user session directory
      const fs = require('fs');
      const path = require('path');
      const sessionDir = path.join(__dirname, '../sessions', `user_${result.insertId}`);
      
      if (!fs.existsSync(sessionDir)) {
        fs.mkdirSync(sessionDir, { recursive: true });
      }

      // Initialize user connection record
      await connection.execute(
        'INSERT INTO user_connections (user_id, session_path) VALUES (?, ?)',
        [result.insertId, sessionDir]
      );

      return {
        success: true,
        user_id: result.insertId,
        username,
        email,
        api_key: apiKey,
        trial_ends_at: trialEndDate,
        message: 'Registrasi berhasil! Menunggu persetujuan admin.'
      };

    } catch (error) {
      throw error;
    }
  }

  // Get pending users (for admin approval)
  async getPendingUsers() {
    const connection = await this.getConnection();
    
    const [rows] = await connection.execute(
      `SELECT 
        id, username, email, phone_number, full_name, 
        created_date, trial_ends_at, payment_status
      FROM users 
      WHERE is_active = 0 AND role = 'user'
      ORDER BY created_date DESC`
    );

    return rows;
  }

  // Get active users
  async getActiveUsers() {
    const connection = await this.getConnection();
    
    const [rows] = await connection.execute(
      `SELECT 
        u.id, u.username, u.email, u.phone_number, u.full_name,
        u.created_date, u.trial_ends_at, u.payment_status, u.expired_date,
        u.last_payment_date, u.subscription_type,
        uc.connection_status, uc.whatsapp_number, uc.last_connected,
        COALESCE(admin.username, 'System') as approved_by_name
      FROM users u
      LEFT JOIN user_connections uc ON u.id = uc.user_id
      LEFT JOIN users admin ON u.approved_by = admin.id
      WHERE u.is_active = 1 AND u.role = 'user'
      ORDER BY u.created_date DESC`
    );

    return rows;
  }

  // Approve user registration
  async approveUser(userId, adminId) {
    const connection = await this.getConnection();
    
    try {
      await connection.beginTransaction();

      // Update user status
      await connection.execute(
        `UPDATE users SET 
          is_active = 1, 
          approved_by = ?, 
          approved_at = NOW(),
          payment_status = 'trial'
        WHERE id = ? AND role = 'user'`,
        [adminId, userId]
      );

      // Get user info for notification
      const [user] = await connection.execute(
        'SELECT username, email FROM users WHERE id = ?',
        [userId]
      );

      await connection.commit();

      return {
        success: true,
        message: `User ${user[0].username} berhasil disetujui`,
        user: user[0]
      };

    } catch (error) {
      await connection.rollback();
      throw error;
    }
  }

  // Reject user registration
  async rejectUser(userId, reason = '') {
    const connection = await this.getConnection();
    
    try {
      // Get user info before deletion
      const [user] = await connection.execute(
        'SELECT username, email FROM users WHERE id = ?',
        [userId]
      );

      if (user.length === 0) {
        throw new Error('User tidak ditemukan');
      }

      // Delete user and related data
      await connection.execute('DELETE FROM users WHERE id = ?', [userId]);

      // Remove session directory
      const fs = require('fs');
      const path = require('path');
      const sessionDir = path.join(__dirname, '../sessions', `user_${userId}`);
      
      if (fs.existsSync(sessionDir)) {
        fs.rmSync(sessionDir, { recursive: true, force: true });
      }

      return {
        success: true,
        message: `User ${user[0].username} berhasil ditolak`,
        user: user[0]
      };

    } catch (error) {
      throw error;
    }
  }

  // Check if user subscription is valid
  async checkSubscription(userId) {
    const connection = await this.getConnection();
    
    const [rows] = await connection.execute(
      `SELECT 
        payment_status, trial_ends_at, expired_date,
        subscription_type, is_active
      FROM users 
      WHERE id = ?`,
      [userId]
    );

    if (rows.length === 0) {
      return { valid: false, reason: 'User tidak ditemukan' };
    }

    const user = rows[0];
    const now = new Date();
    
    // Check if user is active
    if (!user.is_active) {
      return { valid: false, reason: 'Akun belum diaktifkan admin' };
    }

    // Check payment status
    if (user.payment_status === 'suspended') {
      return { valid: false, reason: 'Akun telah disuspend' };
    }

    // Check trial period
    if (user.payment_status === 'trial') {
      const trialEnd = new Date(user.trial_ends_at);
      if (now > trialEnd) {
        // Update status to expired
        await connection.execute(
          'UPDATE users SET payment_status = "expired" WHERE id = ?',
          [userId]
        );
        return { valid: false, reason: 'Masa trial telah berakhir' };
      }
      return { valid: true, reason: 'Trial aktif', expires_at: user.trial_ends_at };
    }

    // Check active subscription
    if (user.payment_status === 'active') {
      if (user.expired_date) {
        const expiredDate = new Date(user.expired_date);
        if (now > expiredDate) {
          // Update status to expired
          await connection.execute(
            'UPDATE users SET payment_status = "expired" WHERE id = ?',
            [userId]
          );
          return { valid: false, reason: 'Subscription telah expired' };
        }
        return { valid: true, reason: 'Subscription aktif', expires_at: user.expired_date };
      }
      // If no expired_date but status is active, consider it valid
      return { valid: true, reason: 'Subscription aktif', expires_at: null };
    }

    // Check if expired
    if (user.payment_status === 'expired') {
      return { valid: false, reason: 'Subscription telah expired' };
    }

    return { valid: false, reason: 'Status subscription tidak valid' };
  }

  // Get user statistics
  async getUserStats() {
    const connection = await this.getConnection();
    
    const [stats] = await connection.execute(`
      SELECT 
        COUNT(*) as total_users,
        SUM(CASE WHEN is_active = 0 THEN 1 ELSE 0 END) as pending_users,
        SUM(CASE WHEN is_active = 1 THEN 1 ELSE 0 END) as active_users,
        SUM(CASE WHEN payment_status = 'trial' THEN 1 ELSE 0 END) as trial_users,
        SUM(CASE WHEN payment_status = 'active' THEN 1 ELSE 0 END) as paid_users,
        SUM(CASE WHEN payment_status = 'expired' THEN 1 ELSE 0 END) as expired_users
      FROM users 
      WHERE role = 'user'
    `);

    return stats[0];
  }

  // Update user subscription
  async updateSubscription(userId, subscriptionType, months = 1) {
    const connection = await this.getConnection();
    
    try {
      await connection.beginTransaction();

      // Calculate new expiry date
      const now = new Date();
      const expiredDate = new Date(now);
      
      if (subscriptionType === 'yearly') {
        expiredDate.setFullYear(expiredDate.getFullYear() + 1);
      } else {
        expiredDate.setMonth(expiredDate.getMonth() + months);
      }

      // Update user subscription
      await connection.execute(
        `UPDATE users SET 
          subscription_type = ?,
          payment_status = 'active',
          expired_date = ?,
          last_payment_date = NOW()
        WHERE id = ?`,
        [subscriptionType, expiredDate.toISOString().split('T')[0], userId]
      );

      await connection.commit();

      return {
        success: true,
        expired_date: expiredDate.toISOString().split('T')[0],
        subscription_type: subscriptionType
      };

    } catch (error) {
      await connection.rollback();
      throw error;
    }
  }
}

module.exports = UserRegistration; 