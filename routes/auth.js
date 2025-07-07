const express = require('express');
const bcrypt = require('bcryptjs');
const { findByUsername, findById, updateUser, validatePassword } = require('../models/User');
const UserRegistration = require('../models/UserRegistration');
const { requireAuth } = require('../middleware/auth');
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

// Change password page
router.get('/change-password', requireAuth, (req, res) => {
  res.render('change-password', { 
    user: req.session.user 
  });
});

// Handle change password
router.post('/change-password', requireAuth, async (req, res) => {
  try {
    const { currentPassword, newPassword, confirmPassword } = req.body;
    const userId = req.session.user.id;
    
    // Validate input
    if (!currentPassword || !newPassword || !confirmPassword) {
      return res.json({
        success: false,
        message: 'Semua field harus diisi'
      });
    }
    
    // Validate password confirmation
    if (newPassword !== confirmPassword) {
      return res.json({
        success: false,
        message: 'Password konfirmasi tidak cocok'
      });
    }
    
    // Validate password length
    if (newPassword.length < 6) {
      return res.json({
        success: false,
        message: 'Password baru minimal 6 karakter'
      });
    }
    
    // Check if new password is different from current
    if (currentPassword === newPassword) {
      return res.json({
        success: false,
        message: 'Password baru harus berbeda dengan password saat ini'
      });
    }
    
    // Get current user data
    const user = await findById(userId);
    if (!user) {
      return res.json({
        success: false,
        message: 'User tidak ditemukan'
      });
    }
    
    // Validate current password
    const isCurrentPasswordValid = await validatePassword(currentPassword, user.password);
    if (!isCurrentPasswordValid) {
      return res.json({
        success: false,
        message: 'Password saat ini salah'
      });
    }
    
    // Update password
    const updateResult = await updateUser(userId, { password: newPassword });
    
    if (!updateResult) {
      return res.json({
        success: false,
        message: 'Gagal mengubah password'
      });
    }
    
    // Log password change activity
    console.log(`Password changed for user: ${user.username} (ID: ${userId}) at ${new Date().toISOString()}`);
    
    res.json({
      success: true,
      message: 'Password berhasil diubah'
    });
    
  } catch (error) {
    console.error('Change password error:', error);
    res.json({
      success: false,
      message: 'Terjadi kesalahan saat mengubah password'
    });
  }
});

// Logout
router.get('/logout', (req, res) => {
  req.session.destroy();
  res.redirect('/auth/login');
});

module.exports = router; 