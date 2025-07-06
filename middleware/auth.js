const UserRegistration = require('../models/UserRegistration');
const userRegistration = new UserRegistration();

// Check if user is authenticated
const requireAuth = (req, res, next) => {
  if (!req.session || !req.session.user) {
    return res.redirect('/auth/login');
  }
  next();
};

// Check if user is admin
const requireAdmin = (req, res, next) => {
  if (!req.session || !req.session.user || req.session.user.role !== 'admin') {
    return res.status(403).render('error', {
      error: 'Akses ditolak. Hanya admin yang dapat mengakses halaman ini.'
    });
  }
  next();
};

// Check if user subscription is valid
const requireValidSubscription = async (req, res, next) => {
  try {
    // Admin bypass subscription check
    if (req.session.user.role === 'admin') {
      return next();
    }

    const subscriptionCheck = await userRegistration.checkSubscription(req.session.user.id);
    
    if (!subscriptionCheck.valid) {
      return res.status(403).render('error', {
        error: subscriptionCheck.reason,
        message: 'Silakan hubungi admin untuk memperpanjang subscription Anda.'
      });
    }
    
    // Update session with latest subscription info
    req.session.user.subscription_expires = subscriptionCheck.expires_at;
    
    next();
  } catch (error) {
    console.error('Subscription check error:', error);
    return res.status(500).render('error', {
      error: 'Gagal memeriksa status subscription'
    });
  }
};

// API authentication middleware
const requireApiAuth = async (req, res, next) => {
  try {
    const apiKey = req.query.api_key || req.body.api_key || req.headers['x-api-key'];
    
    if (!apiKey) {
      return res.status(401).json({
        success: false,
        message: 'API key diperlukan'
      });
    }

    // Find user by API key
    const mysql = require('mysql2/promise');
    const dbConfig = require('../config/database');
    const connection = await mysql.createConnection(dbConfig);
    
    const [users] = await connection.execute(
      'SELECT * FROM users WHERE api_key = ? AND is_active = 1',
      [apiKey]
    );

    if (users.length === 0) {
      return res.status(401).json({
        success: false,
        message: 'API key tidak valid'
      });
    }

    const user = users[0];

    // Check subscription for non-admin users
    if (user.role !== 'admin') {
      const subscriptionCheck = await userRegistration.checkSubscription(user.id);
      
      if (!subscriptionCheck.valid) {
        return res.status(403).json({
          success: false,
          message: subscriptionCheck.reason
        });
      }
    }

    // Attach user to request
    req.user = user;
    
    // Log API usage
    await connection.execute(
      `INSERT INTO user_api_usage 
       (user_id, endpoint, method, ip_address, user_agent, created_at) 
       VALUES (?, ?, ?, ?, ?, NOW())`,
      [
        user.id,
        req.path,
        req.method,
        req.ip,
        req.get('User-Agent') || 'Unknown'
      ]
    );

    next();
  } catch (error) {
    console.error('API auth error:', error);
    return res.status(500).json({
      success: false,
      message: 'Kesalahan server saat verifikasi API'
    });
  }
};

// Flash message middleware
const flashMessage = (req, res, next) => {
  res.locals.flash = req.session.flash || {};
  delete req.session.flash;
  next();
};

module.exports = {
  requireAuth,
  requireAdmin,
  requireValidSubscription,
  requireApiAuth,
  flashMessage
}; 