const mysql = require('mysql2/promise');
const config = require('../config/database');

/**
 * Middleware untuk menambahkan notifikasi admin
 * Menghitung jumlah user pending dan data admin lainnya
 */
const addAdminNotifications = async (req, res, next) => {
  try {
    // Hanya untuk user yang sudah login
    if (req.session && req.session.user) {
      // Hanya untuk admin
      if (req.session.user.role === 'admin') {
        const connection = await mysql.createConnection(config);
        
        // Hitung user pending approval
        const [pendingUsers] = await connection.execute(
          'SELECT COUNT(*) as count FROM users WHERE is_active = 0'
        );
        
        // Hitung user yang trial akan habis (7 hari ke depan)
        const [trialExpiring] = await connection.execute(
          'SELECT COUNT(*) as count FROM users WHERE payment_status = "trial" AND trial_ends_at <= DATE_ADD(NOW(), INTERVAL 7 DAY) AND trial_ends_at > NOW()'
        );
        
        // Hitung pembayaran pending
        const [pendingPayments] = await connection.execute(
          'SELECT COUNT(*) as count FROM user_payments WHERE status = "pending"'
        );
        
        await connection.end();
        
        // Tambahkan ke res.locals agar bisa diakses di semua template
        res.locals.adminNotifications = {
          pendingUsers: pendingUsers[0].count,
          trialExpiring: trialExpiring[0].count,
          pendingPayments: pendingPayments[0].count,
          totalNotifications: pendingUsers[0].count + trialExpiring[0].count + pendingPayments[0].count
        };
      }
    }
    
    next();
  } catch (error) {
    console.error('Error in adminNotification middleware:', error);
    // Jika error, set default values
    res.locals.adminNotifications = {
      pendingUsers: 0,
      trialExpiring: 0,
      pendingPayments: 0,
      totalNotifications: 0
    };
    next();
  }
};

module.exports = { addAdminNotifications }; 