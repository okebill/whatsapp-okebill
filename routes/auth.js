const express = require('express');
const bcrypt = require('bcryptjs');
const { findByUsername, findById } = require('../models/User');
const UserRegistration = require('../models/UserRegistration');
const router = express.Router();

// Initialize UserRegistration
const userRegistration = new UserRegistration();

// Login page
router.get('/login', (req, res) => {
  res.render('login', { error: null });
});

// Registration page
router.get('/register', (req, res) => {
  res.render('register', { error: null, success: null });
});

// Handle registration
router.post('/register', async (req, res) => {
  try {
    const { username, password, confirm_password, email, phone_number, full_name } = req.body;
    
    // Validate password confirmation
    if (password !== confirm_password) {
      return res.render('register', { 
        error: 'Password dan konfirmasi password tidak cocok',
        success: null 
      });
    }

    // Validate password strength
    if (password.length < 6) {
      return res.render('register', { 
        error: 'Password minimal 6 karakter',
        success: null 
      });
    }

    // Register user
    const result = await userRegistration.registerUser({
      username,
      password,
      email,
      phone_number,
      full_name
    });

    res.render('register', { 
      error: null, 
      success: result.message 
    });

  } catch (error) {
    console.error('Registration error:', error);
    res.render('register', { 
      error: error.message,
      success: null 
    });
  }
});

// Handle login
router.post('/login', async (req, res) => {
  try {
    const { username, password } = req.body;
    
    const user = await findByUsername(username);
    
    if (!user) {
      return res.render('login', { error: 'Username tidak ditemukan' });
    }

    const isValidPassword = await bcrypt.compare(password, user.password);
    
    if (!isValidPassword) {
      return res.render('login', { error: 'Password salah' });
    }

    // Check if user is active (for non-admin users)
    if (user.role !== 'admin' && !user.is_active) {
      return res.render('login', { error: 'Akun Anda belum diaktifkan oleh admin' });
    }

    // Check subscription status for regular users
    if (user.role !== 'admin') {
      const subscriptionCheck = await userRegistration.checkSubscription(user.id);
      if (!subscriptionCheck.valid) {
        return res.render('login', { error: subscriptionCheck.reason });
      }
    }

    // Set session
    req.session.user = {
      id: user.id,
      username: user.username,
      role: user.role,
      email: user.email,
      payment_status: user.payment_status,
      subscription_type: user.subscription_type,
      expired_date: user.expired_date
    };

    res.redirect('/dashboard');
  } catch (error) {
    console.error('Login error:', error);
    res.render('login', { error: 'Terjadi kesalahan saat login' });
  }
});

// Logout
router.get('/logout', (req, res) => {
  req.session.destroy();
  res.redirect('/auth/login');
});

module.exports = router; 