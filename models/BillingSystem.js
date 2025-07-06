const mysql = require('mysql2/promise');
const crypto = require('crypto');
const dbConfig = require('../config/database');

class BillingSystem {
  constructor() {
    this.connection = null;
    this.pricing = {
      monthly: {
        price: 50000,
        duration: 30, // days
        name: 'Bulanan'
      },
      yearly: {
        price: 500000,
        duration: 365, // days
        name: 'Tahunan'
      }
    };
  }

  async getConnection() {
    if (!this.connection) {
      this.connection = await mysql.createConnection(dbConfig);
    }
    return this.connection;
  }

  // Generate unique transaction ID
  generateTransactionId() {
    const timestamp = Date.now();
    const random = crypto.randomBytes(4).toString('hex');
    return `TXN-${timestamp}-${random}`.toUpperCase();
  }

  // Generate invoice number
  generateInvoiceNumber() {
    const date = new Date();
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const timestamp = Date.now().toString().slice(-6);
    return `INV-${year}${month}-${timestamp}`;
  }

  // Calculate subscription end date
  calculateEndDate(subscriptionType, startDate = new Date()) {
    const endDate = new Date(startDate);
    const pricing = this.pricing[subscriptionType];
    
    if (!pricing) {
      throw new Error('Invalid subscription type');
    }

    endDate.setDate(endDate.getDate() + pricing.duration);
    return endDate;
  }

  // Create payment record
  async createPayment(userId, subscriptionType, paymentMethod = 'manual', notes = '') {
    const connection = await this.getConnection();
    
    try {
      await connection.beginTransaction();

      const pricing = this.pricing[subscriptionType];
      if (!pricing) {
        throw new Error('Tipe subscription tidak valid');
      }

      const transactionId = this.generateTransactionId();
      const invoiceNumber = this.generateInvoiceNumber();
      const expiredDate = this.calculateEndDate(subscriptionType);

      // Insert payment record
      const [paymentResult] = await connection.execute(
        `INSERT INTO user_payments (
          user_id, amount, currency, expired_date, 
          payment_method, transaction_id, invoice_number, 
          status, notes
        ) VALUES (?, ?, 'IDR', ?, ?, ?, ?, 'pending', ?)`,
        [
          userId, 
          pricing.price, 
          expiredDate.toISOString().split('T')[0],
          paymentMethod, 
          transactionId, 
          invoiceNumber,
          notes
        ]
      );

      await connection.commit();

      return {
        success: true,
        payment_id: paymentResult.insertId,
        transaction_id: transactionId,
        invoice_number: invoiceNumber,
        amount: pricing.price,
        expired_date: expiredDate.toISOString().split('T')[0],
        message: 'Payment record berhasil dibuat'
      };

    } catch (error) {
      await connection.rollback();
      throw error;
    }
  }

  // Confirm payment and activate subscription
  async confirmPayment(paymentId, adminId) {
    const connection = await this.getConnection();
    
    try {
      await connection.beginTransaction();

      // Get payment details
      const [payments] = await connection.execute(
        'SELECT * FROM user_payments WHERE id = ?',
        [paymentId]
      );

      if (payments.length === 0) {
        throw new Error('Payment tidak ditemukan');
      }

      const payment = payments[0];

      if (payment.status === 'paid') {
        throw new Error('Payment sudah dikonfirmasi');
      }

      // Update payment status
      await connection.execute(
        'UPDATE user_payments SET status = "paid", updated_at = NOW() WHERE id = ?',
        [paymentId]
      );

      // Update user subscription
      const subscriptionType = payment.amount === 50000 ? 'monthly' : 'yearly';
      
      await connection.execute(
        `UPDATE users SET 
          subscription_type = ?,
          payment_status = 'active',
          expired_date = ?,
          last_payment_date = NOW()
        WHERE id = ?`,
        [subscriptionType, payment.expired_date, payment.user_id]
      );

      await connection.commit();

      return {
        success: true,
        message: 'Payment berhasil dikonfirmasi dan subscription diaktifkan',
        user_id: payment.user_id,
        expired_date: payment.expired_date
      };

    } catch (error) {
      await connection.rollback();
      throw error;
    }
  }

  // Get user payment history
  async getUserPaymentHistory(userId) {
    const connection = await this.getConnection();
    
    const [payments] = await connection.execute(
      `SELECT 
        id, amount, currency, payment_date, expired_date,
        payment_method, transaction_id, invoice_number,
        status, notes, created_at
      FROM user_payments 
      WHERE user_id = ? 
      ORDER BY created_at DESC`,
      [userId]
    );

    return payments;
  }

  // Get pending payments for admin
  async getPendingPayments() {
    const connection = await this.getConnection();
    
    const [payments] = await connection.execute(
      `SELECT 
        up.id, up.amount, up.currency, up.payment_date, up.expired_date,
        up.payment_method, up.transaction_id, up.invoice_number,
        up.status, up.notes, up.created_at,
        u.username, u.email, u.full_name
      FROM user_payments up
      JOIN users u ON up.user_id = u.id
      WHERE up.status = 'pending'
      ORDER BY up.created_at DESC`
    );

    return payments;
  }

  // Get all payments for admin
  async getAllPayments(limit = 50, offset = 0) {
    const connection = await this.getConnection();
    
    const [payments] = await connection.execute(
      `SELECT 
        up.id, up.amount, up.currency, up.payment_date, up.expired_date,
        up.payment_method, up.transaction_id, up.invoice_number,
        up.status, up.notes, up.created_at,
        u.username, u.email, u.full_name
      FROM user_payments up
      JOIN users u ON up.user_id = u.id
      ORDER BY up.created_at DESC
      LIMIT ? OFFSET ?`,
      [limit, offset]
    );

    return payments;
  }

  // Get payment statistics
  async getPaymentStats() {
    const connection = await this.getConnection();
    
    const [stats] = await connection.execute(`
      SELECT 
        COUNT(*) as total_payments,
        SUM(CASE WHEN status = 'paid' THEN amount ELSE 0 END) as total_revenue,
        SUM(CASE WHEN status = 'pending' THEN 1 ELSE 0 END) as pending_payments,
        SUM(CASE WHEN status = 'paid' THEN 1 ELSE 0 END) as confirmed_payments,
        SUM(CASE WHEN status = 'failed' THEN 1 ELSE 0 END) as failed_payments,
        AVG(CASE WHEN status = 'paid' THEN amount ELSE NULL END) as avg_payment
      FROM user_payments
    `);

    const [monthlyStats] = await connection.execute(`
      SELECT 
        DATE_FORMAT(payment_date, '%Y-%m') as month,
        COUNT(*) as payment_count,
        SUM(amount) as revenue
      FROM user_payments 
      WHERE status = 'paid' 
        AND payment_date >= DATE_SUB(NOW(), INTERVAL 12 MONTH)
      GROUP BY DATE_FORMAT(payment_date, '%Y-%m')
      ORDER BY month DESC
    `);

    return {
      overview: stats[0],
      monthly: monthlyStats
    };
  }

  // Cancel payment
  async cancelPayment(paymentId, reason = '') {
    const connection = await this.getConnection();
    
    try {
      await connection.beginTransaction();

      // Get payment details
      const [payments] = await connection.execute(
        'SELECT * FROM user_payments WHERE id = ?',
        [paymentId]
      );

      if (payments.length === 0) {
        throw new Error('Payment tidak ditemukan');
      }

      const payment = payments[0];

      if (payment.status === 'paid') {
        throw new Error('Payment yang sudah dikonfirmasi tidak bisa dibatalkan');
      }

      // Update payment status
      await connection.execute(
        'UPDATE user_payments SET status = "failed", notes = ?, updated_at = NOW() WHERE id = ?',
        [reason, paymentId]
      );

      await connection.commit();

      return {
        success: true,
        message: 'Payment berhasil dibatalkan'
      };

    } catch (error) {
      await connection.rollback();
      throw error;
    }
  }

  // Check subscription expiry and update status
  async checkAndUpdateExpiredSubscriptions() {
    const connection = await this.getConnection();
    
    try {
      // Get users with expired subscriptions
      const [expiredUsers] = await connection.execute(
        `SELECT id, username, expired_date 
         FROM users 
         WHERE payment_status = 'active' 
           AND expired_date < CURDATE()`
      );

      if (expiredUsers.length === 0) {
        return {
          success: true,
          message: 'Tidak ada subscription yang expired',
          updated_count: 0
        };
      }

      // Update expired users
      await connection.execute(
        `UPDATE users 
         SET payment_status = 'expired' 
         WHERE payment_status = 'active' 
           AND expired_date < CURDATE()`
      );

      return {
        success: true,
        message: `${expiredUsers.length} subscription berhasil diupdate ke status expired`,
        updated_count: expiredUsers.length,
        expired_users: expiredUsers
      };

    } catch (error) {
      throw error;
    }
  }

  // Generate invoice data
  async generateInvoice(paymentId) {
    const connection = await this.getConnection();
    
    const [payments] = await connection.execute(
      `SELECT 
        up.*, u.username, u.email, u.full_name, u.phone_number
      FROM user_payments up
      JOIN users u ON up.user_id = u.id
      WHERE up.id = ?`,
      [paymentId]
    );

    if (payments.length === 0) {
      throw new Error('Payment tidak ditemukan');
    }

    const payment = payments[0];
    const subscriptionType = payment.amount === 50000 ? 'monthly' : 'yearly';

    return {
      invoice_number: payment.invoice_number,
      transaction_id: payment.transaction_id,
      customer: {
        name: payment.full_name || payment.username,
        email: payment.email,
        phone: payment.phone_number
      },
      items: [{
        description: `Eglobaltech WA-Gateway - Subscription ${this.pricing[subscriptionType].name}`,
        quantity: 1,
        price: payment.amount,
        total: payment.amount
      }],
      total: payment.amount,
      currency: payment.currency,
      status: payment.status,
      payment_date: payment.payment_date,
      created_date: payment.created_at,
      due_date: payment.expired_date,
      notes: payment.notes
    };
  }

  // Get subscription pricing
  getPricing() {
    return this.pricing;
  }

  // Update pricing (admin only)
  async updatePricing(subscriptionType, price) {
    const connection = await this.getConnection();
    
    if (!this.pricing[subscriptionType]) {
      throw new Error('Tipe subscription tidak valid');
    }

    const settingKey = subscriptionType === 'monthly' ? 'monthly_price' : 'yearly_price';
    
    await connection.execute(
      'UPDATE system_settings SET setting_value = ? WHERE setting_key = ?',
      [price.toString(), settingKey]
    );

    // Update local pricing
    this.pricing[subscriptionType].price = price;

    return {
      success: true,
      message: `Harga ${subscriptionType} berhasil diupdate ke ${price}`
    };
  }

  // Get revenue report
  async getRevenueReport(startDate, endDate) {
    const connection = await this.getConnection();
    
    const [revenue] = await connection.execute(
      `SELECT 
        DATE(payment_date) as date,
        COUNT(*) as payment_count,
        SUM(amount) as daily_revenue
      FROM user_payments 
      WHERE status = 'paid' 
        AND payment_date BETWEEN ? AND ?
      GROUP BY DATE(payment_date)
      ORDER BY date DESC`,
      [startDate, endDate]
    );

    const [summary] = await connection.execute(
      `SELECT 
        COUNT(*) as total_payments,
        SUM(amount) as total_revenue,
        AVG(amount) as avg_payment
      FROM user_payments 
      WHERE status = 'paid' 
        AND payment_date BETWEEN ? AND ?`,
      [startDate, endDate]
    );

    return {
      daily_revenue: revenue,
      summary: summary[0]
    };
  }
}

module.exports = BillingSystem; 