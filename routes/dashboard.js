const express = require('express');
const router = express.Router();
const { isAuthenticated } = require('./auth');
const { getConnectionStatus, getGroups } = require('../utils/whatsappClient');

// Halaman utama dashboard
router.get('/', isAuthenticated, (req, res) => {
  const isConnected = getConnectionStatus();
  res.render('dashboard', { 
    username: req.session.username,
    connected: isConnected
  });
});

// Halaman scan QR code
router.get('/scan', isAuthenticated, (req, res) => {
  res.render('scan', { 
    username: req.session.username
  });
});

// Halaman test kirim pesan
router.get('/send-message', isAuthenticated, (req, res) => {
  const isConnected = getConnectionStatus();
  res.render('send-message', { 
    username: req.session.username,
    connected: isConnected,
    sent: false
  });
});

// Halaman lihat grup
router.get('/groups', isAuthenticated, (req, res) => {
  const isConnected = getConnectionStatus();
  const groups = getGroups();
  res.render('groups', { 
    username: req.session.username,
    connected: isConnected,
    groups: groups
  });
});

// Halaman dokumentasi API
router.get('/api-docs', isAuthenticated, (req, res) => {
  res.render('api-docs', { 
    username: req.session.username
  });
});

module.exports = router; 