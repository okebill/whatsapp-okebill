const express = require('express');
const router = express.Router();
const User = require('../models/User');
const bcrypt = require('bcryptjs');
const db = require('../config/database');
require('dotenv').config();

// Middleware untuk cek apakah user sudah login
function isAuthenticated(req, res, next) {
  if (req.session && req.session.user) {
    return next();
  }
  res.redirect('/login');
}

// Middleware untuk cek apakah user belum login
function isNotAuthenticated(req, res, next) {
  if (req.session && req.session.user) {
    return res.redirect('/dashboard');
  }
  next();
}

// Login page
router.get('/login', isNotAuthenticated, (req, res) => {
  res.render('login', { error: null });
});

// Generate hash untuk testing
router.get('/generate-hash/:password', async (req, res) => {
  try {
    const password = req.params.password;
    const hash = await bcrypt.hash(password, 10);
    res.json({
      password,
      hash,
      note: 'Gunakan hash ini untuk update di database'
    });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Login process
router.post('/login', isNotAuthenticated, async (req, res) => {
  const { username, password } = req.body;
  
  try {
    console.log('Mencoba login untuk user:', username);
    
    // Validasi input
    if (!username || !password) {
      console.log('Login gagal: Username atau password kosong');
      return res.render('login', { 
        error: 'Username dan password harus diisi' 
      });
    }

    // Cari user di database
    const user = await User.findByUsername(username);
    console.log('Hasil pencarian user:', user ? 'Ditemukan' : 'Tidak ditemukan');

    if (!user) {
      console.log('Login gagal: User tidak ditemukan');
      return res.render('login', { 
        error: 'Username atau password salah' 
      });
    }

    // Verifikasi password
    const isValid = await User.validatePassword(password, user.password);
    console.log('Hasil verifikasi password:', isValid ? 'Valid' : 'Invalid');

    if (!isValid) {
      console.log('Login gagal: Password tidak valid');
      return res.render('login', { 
        error: 'Username atau password salah' 
      });
    }

    // Set session
    req.session.user = {
      id: user.id,
      username: user.username,
      role: user.role
    };

    console.log('Login berhasil untuk user:', username);
    res.redirect('/dashboard');

  } catch (error) {
    console.error('Error saat proses login:', error);
    res.render('login', { 
      error: 'Terjadi kesalahan pada database, silakan coba lagi' 
    });
  }
});

// Update password langsung di database
router.post('/update-password', async (req, res) => {
  const { username, newPassword } = req.body;
  
  try {
    // Hash password baru
    const hashedPassword = await bcrypt.hash(newPassword, 10);
    
    // Update password di database
    await db.execute(
      'UPDATE users SET password = ? WHERE username = ?',
      [hashedPassword, username]
    );
    
    res.json({ 
      success: true, 
      message: 'Password berhasil diupdate',
      username,
      note: 'Password sudah di-hash dengan bcrypt'
    });
  } catch (error) {
    console.error('Error updating password:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Gagal mengupdate password',
      error: error.message 
    });
  }
});

// Logout
router.get('/logout', isAuthenticated, (req, res) => {
  req.session.destroy();
  res.redirect('/login');
});

module.exports = router; 