const express = require('express');
const router = express.Router();
const { isAuthenticated } = require('../middleware/auth');
const { getConnectionStatus, getGroups, getConnectedNumber } = require('../utils/whatsappClient');

// Safely import API config with fallback
let API_KEY;
try {
  const apiConfig = require('../config/api');
  API_KEY = apiConfig.API_KEY || 'your_api_key_here';
} catch (error) {
  console.error('Error loading API config:', error);
  API_KEY = process.env.API_KEY || 'your_api_key_here';
}

// Dashboard utama
router.get('/', isAuthenticated, async (req, res) => {
  try {
    const whatsappStatus = getConnectionStatus();
    const connectedNumber = getConnectedNumber();
    let groups = [];
    
    try {
      groups = await getGroups();
    } catch (groupError) {
      console.warn('Warning: Could not fetch groups:', groupError.message);
      groups = [];
    }

    res.render('dashboard', {
      user: req.session.user,
      whatsappStatus,
      connectedNumber,
      groups,
      error: null
    });
  } catch (error) {
    console.error('Error loading dashboard:', error);
    res.render('dashboard', {
      user: req.session.user,
      whatsappStatus: false,
      connectedNumber: null,
      groups: [],
      error: 'Terjadi kesalahan saat memuat data'
    });
  }
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

// Halaman daftar grup
router.get('/groups', isAuthenticated, async (req, res) => {
  try {
    const whatsappStatus = getConnectionStatus();
    let groups = [];
    let error = null;
    
    try {
      groups = await getGroups();
    } catch (groupError) {
      console.warn('Warning: Could not fetch groups:', groupError.message);
      groups = [];
      if (!whatsappStatus) {
        error = 'WhatsApp belum terhubung. Silakan scan QR code terlebih dahulu.';
      } else {
        error = 'Tidak dapat memuat daftar grup. Pastikan WhatsApp sudah terhubung dengan baik.';
      }
    }
    
    res.render('groups', {
      user: req.session.user,
      groups,
      whatsappStatus,
      error
    });
  } catch (error) {
    console.error('Error loading groups page:', error);
    res.render('groups', {
      user: req.session.user,
      groups: [],
      whatsappStatus: false,
      error: 'Terjadi kesalahan saat memuat halaman grup'
    });
  }
});

// Halaman dokumentasi API
router.get('/api-docs', isAuthenticated, (req, res) => {
  try {
    // Gunakan nomor yang benar-benar terscan, bukan dari config
    const connectedNumber = getConnectedNumber();
    const actualSenderId = connectedNumber || 'Belum ada nomor terscan';
    
    res.render('api-docs', {
      user: req.session.user,
      baseUrl: `${req.protocol}://${req.get('host')}`,
      apiKey: API_KEY,
      senderId: actualSenderId,
      isConnected: getConnectionStatus()
    });
  } catch (error) {
    console.error('Error loading api-docs:', error);
    res.status(500).render('error', {
      error: 'Terjadi kesalahan saat memuat dokumentasi API',
      message: error.message
    });
  }
});

module.exports = router; 