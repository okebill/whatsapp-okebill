const express = require('express');
const UserRegistration = require('../models/UserRegistration');
const { requireAuth, requireAdmin } = require('../middleware/auth');
const router = express.Router();

// Initialize UserRegistration
const userRegistration = new UserRegistration();

// Admin middleware - ensure user is admin
router.use(requireAuth);
router.use(requireAdmin);

// Admin dashboard
router.get('/', async (req, res) => {
  try {
    const stats = await userRegistration.getUserStats();
    const pendingUsers = await userRegistration.getPendingUsers();
    const activeUsers = await userRegistration.getActiveUsers();
    
    res.render('admin/dashboard', {
      user: req.session.user,
      stats,
      pendingUsers: pendingUsers.slice(0, 5), // Show only 5 recent
      activeUsers: activeUsers.slice(0, 5), // Show only 5 recent
      title: 'Admin Dashboard'
    });
  } catch (error) {
    console.error('Admin dashboard error:', error);
    res.render('error', { error: 'Gagal memuat dashboard admin' });
  }
});

// User management page
router.get('/users', async (req, res) => {
  try {
    const pendingUsers = await userRegistration.getPendingUsers();
    const activeUsers = await userRegistration.getActiveUsers();
    const stats = await userRegistration.getUserStats();
    
    res.render('admin/users', {
      user: req.session.user,
      pendingUsers,
      activeUsers,
      stats,
      title: 'Manajemen User'
    });
  } catch (error) {
    console.error('User management error:', error);
    res.render('error', { error: 'Gagal memuat data user' });
  }
});

// Approve user
router.post('/users/:id/approve', async (req, res) => {
  try {
    const userId = req.params.id;
    const adminId = req.session.user.id;
    
    const result = await userRegistration.approveUser(userId, adminId);
    
    req.session.flash = {
      type: 'success',
      message: result.message
    };
    
    res.redirect('/admin/users');
  } catch (error) {
    console.error('Approve user error:', error);
    req.session.flash = {
      type: 'error',
      message: 'Gagal menyetujui user: ' + error.message
    };
    res.redirect('/admin/users');
  }
});

// Reject user
router.post('/users/:id/reject', async (req, res) => {
  try {
    const userId = req.params.id;
    const reason = req.body.reason || '';
    
    const result = await userRegistration.rejectUser(userId, reason);
    
    req.session.flash = {
      type: 'success',
      message: result.message
    };
    
    res.redirect('/admin/users');
  } catch (error) {
    console.error('Reject user error:', error);
    req.session.flash = {
      type: 'error',
      message: 'Gagal menolak user: ' + error.message
    };
    res.redirect('/admin/users');
  }
});

// Suspend user
router.post('/users/:id/suspend', async (req, res) => {
  try {
    const userId = req.params.id;
    const reason = req.body.reason || '';
    
    // Update user status to suspended
    const mysql = require('mysql2/promise');
    const dbConfig = require('../config/database');
    const connection = await mysql.createConnection(dbConfig);
    
    await connection.execute(
      'UPDATE users SET payment_status = "suspended" WHERE id = ?',
      [userId]
    );
    
    req.session.flash = {
      type: 'success',
      message: 'User berhasil disuspend'
    };
    
    res.redirect('/admin/users');
  } catch (error) {
    console.error('Suspend user error:', error);
    req.session.flash = {
      type: 'error',
      message: 'Gagal suspend user: ' + error.message
    };
    res.redirect('/admin/users');
  }
});

// Reactivate user
router.post('/users/:id/reactivate', async (req, res) => {
  try {
    const userId = req.params.id;
    
    // Update user status to active
    const mysql = require('mysql2/promise');
    const dbConfig = require('../config/database');
    const connection = await mysql.createConnection(dbConfig);
    
    await connection.execute(
      'UPDATE users SET payment_status = "active" WHERE id = ?',
      [userId]
    );
    
    req.session.flash = {
      type: 'success',
      message: 'User berhasil diaktifkan kembali'
    };
    
    res.redirect('/admin/users');
  } catch (error) {
    console.error('Reactivate user error:', error);
    req.session.flash = {
      type: 'error',
      message: 'Gagal mengaktifkan user: ' + error.message
    };
    res.redirect('/admin/users');
  }
});

// Update user subscription
router.post('/users/:id/subscription', async (req, res) => {
  try {
    const userId = req.params.id;
    const { subscription_type, months } = req.body;
    
    const result = await userRegistration.updateSubscription(
      userId, 
      subscription_type, 
      parseInt(months) || 1
    );
    
    req.session.flash = {
      type: 'success',
      message: `Subscription berhasil diupdate sampai ${result.expired_date}`
    };
    
    res.redirect('/admin/users');
  } catch (error) {
    console.error('Update subscription error:', error);
    req.session.flash = {
      type: 'error',
      message: 'Gagal update subscription: ' + error.message
    };
    res.redirect('/admin/users');
  }
});

// System settings
router.get('/settings', async (req, res) => {
  try {
    const mysql = require('mysql2/promise');
    const dbConfig = require('../config/database');
    const connection = await mysql.createConnection(dbConfig);
    
    const [settings] = await connection.execute(
      'SELECT * FROM system_settings ORDER BY setting_key'
    );
    
    res.render('admin/settings', {
      user: req.session.user,
      settings,
      title: 'Pengaturan Sistem'
    });
  } catch (error) {
    console.error('Settings error:', error);
    res.render('error', { error: 'Gagal memuat pengaturan' });
  }
});

// Update system settings
router.post('/settings', async (req, res) => {
  try {
    const mysql = require('mysql2/promise');
    const dbConfig = require('../config/database');
    const connection = await mysql.createConnection(dbConfig);
    
    // Update each setting
    for (const [key, value] of Object.entries(req.body)) {
      await connection.execute(
        'UPDATE system_settings SET setting_value = ? WHERE setting_key = ?',
        [value, key]
      );
    }
    
    req.session.flash = {
      type: 'success',
      message: 'Pengaturan berhasil disimpan'
    };
    
    res.redirect('/admin/settings');
  } catch (error) {
    console.error('Update settings error:', error);
    req.session.flash = {
      type: 'error',
      message: 'Gagal menyimpan pengaturan: ' + error.message
    };
    res.redirect('/admin/settings');
  }
});

// API usage statistics
router.get('/api-usage', async (req, res) => {
  try {
    const mysql = require('mysql2/promise');
    const dbConfig = require('../config/database');
    const connection = await mysql.createConnection(dbConfig);
    
    // Get API usage statistics
    const [dailyUsage] = await connection.execute(`
      SELECT 
        DATE(created_at) as date,
        COUNT(*) as total_requests,
        COUNT(DISTINCT user_id) as unique_users,
        AVG(response_time_ms) as avg_response_time
      FROM user_api_usage 
      WHERE created_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)
      GROUP BY DATE(created_at)
      ORDER BY date DESC
    `);
    
    const [topUsers] = await connection.execute(`
      SELECT 
        u.username,
        COUNT(uau.id) as total_requests,
        AVG(uau.response_time_ms) as avg_response_time
      FROM user_api_usage uau
      JOIN users u ON uau.user_id = u.id
      WHERE uau.created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)
      GROUP BY u.id, u.username
      ORDER BY total_requests DESC
      LIMIT 10
    `);
    
    res.render('admin/api-usage', {
      user: req.session.user,
      dailyUsage,
      topUsers,
      title: 'Statistik API'
    });
  } catch (error) {
    console.error('API usage error:', error);
    res.render('error', { error: 'Gagal memuat statistik API' });
  }
});

module.exports = router; 