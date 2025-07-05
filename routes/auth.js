const express = require('express');
const router = express.Router();
const User = require('../models/User');
const bcrypt = require('bcryptjs');
const db = require('../config/database');
require('dotenv').config();

// Route login page
router.get('/login', (req, res) => {
  if (req.session.loggedin) {
    return res.redirect('/dashboard');
  }
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

// Proses login
router.post('/login', async (req, res) => {
  const { username, password } = req.body;
  
  try {
    console.log('Mencoba login untuk username:', username);
    
    // Coba login dengan database
    const user = await User.findByUsername(username);
    console.log('Data user dari database:', user ? 'ditemukan' : 'tidak ditemukan');
    
    if (user) {
      // Jika user ditemukan, verifikasi password
      const isValid = await User.verifyPassword(password, user.password);
      console.log('Hasil verifikasi password:', isValid ? 'valid' : 'tidak valid');
      
      if (isValid) {
        req.session.loggedin = true;
        req.session.username = username;
        req.session.userId = user.id;
        console.log('Login berhasil, redirect ke dashboard');
        return res.redirect('/dashboard');
      }
    }
    
    // Jika login gagal
    console.log('Login gagal: username/password salah');
    res.render('login', { error: 'Username atau password salah' });
    
  } catch (error) {
    console.error('Error saat proses login:', error);
    res.render('login', { error: 'Terjadi kesalahan pada database, silakan coba lagi' });
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
router.get('/logout', (req, res) => {
  req.session.destroy(() => {
    res.redirect('/auth/login');
  });
});

// Middleware cek otentikasi untuk rute lain
const isAuthenticated = (req, res, next) => {
  if (req.session.loggedin) {
    return next();
  }
  res.redirect('/auth/login');
};

module.exports = {
  router,
  isAuthenticated
}; 