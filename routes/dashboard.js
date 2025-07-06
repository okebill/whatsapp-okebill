const express = require('express');
const router = express.Router();
const { requireAuth, requireValidSubscription } = require('../middleware/auth');
const multiTenantWhatsApp = require('../utils/multiTenantWhatsApp');
const User = require('../models/User');
const Contact = require('../models/Contact');
const MessageStats = require('../models/MessageStats');

// Middleware autentikasi untuk semua route dashboard
router.use(requireAuth);
router.use(requireValidSubscription);

// Dashboard utama
router.get('/', async (req, res) => {
  try {
    const { findById, getDeviceInfo } = require('../models/User');
    const userId = req.session.user.id;
    
    // Ambil informasi user dan device
    const user = await findById(userId);
    const deviceInfo = await getDeviceInfo(userId);
    
    // Ambil statistik pesan
    let messageStats = null;
    let dailyStats = [];
    let recentMessages = [];
    
    try {
      messageStats = await MessageStats.getUserMessageStats(userId);
      dailyStats = await MessageStats.getDailyStats(userId);
      recentMessages = await MessageStats.getRecentMessages(userId, 5);
    } catch (statsError) {
      console.error('Error getting message stats:', statsError);
      // Jika error database, buat tabel yang diperlukan
      try {
        await MessageStats.initDB();
        messageStats = await MessageStats.getUserMessageStats(userId);
        dailyStats = await MessageStats.getDailyStats(userId);
        recentMessages = await MessageStats.getRecentMessages(userId, 5);
      } catch (initError) {
        console.error('Error initializing message stats:', initError);
      }
    }
    
    // Ambil status WhatsApp untuk user ini
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    const isConnected = connectionStatus.connected;
    const connectedNumber = connectionStatus.number;
    const profilePicture = connectionStatus.profilePicture;
    const qrCode = multiTenantWhatsApp.getQR(userId);
    
    res.render('dashboard', {
      title: 'Dashboard',
      user: req.session.user,
      apiKey: user?.api_key,
      deviceInfo: deviceInfo,
      isConnected: isConnected || false,
      connectedNumber: connectedNumber || null,
      profilePicture: profilePicture || null,
      qrCode: qrCode || null,
      messageStats: messageStats || {},
      dailyStats: dailyStats || [],
      recentMessages: recentMessages || [],
      error: null // Tambahkan error sebagai null secara default
    });
  } catch (error) {
    console.error('Error dashboard:', error);
    res.render('dashboard', {
      title: 'Dashboard', 
      user: req.session.user,
      apiKey: null,
      deviceInfo: null,
      isConnected: false,
      connectedNumber: null,
      profilePicture: null,
      qrCode: null,
      messageStats: {},
      dailyStats: [],
      recentMessages: [],
      error: 'Terjadi kesalahan saat memuat dashboard: ' + error.message
    });
  }
});

// Halaman scan QR code
router.get('/scan', (req, res) => {
  res.render('scan', {
    user: req.session.user
  });
});

// Endpoint untuk mendapatkan status QR code
router.get('/qr-status', (req, res) => {
  const userId = req.session.user.id;
  const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
  const qr = multiTenantWhatsApp.getQR(userId);
  
  res.json({
    qr,
    isConnected: connectionStatus.connected
  });
});

// Halaman test kirim pesan
router.get('/send-message', (req, res) => {
  const userId = req.session.user.id;
  const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
  res.render('send-message', { 
    user: req.session.user,
    isConnected: connectionStatus.connected,
    error: null,
    success: null
  });
});

// Handle pengiriman pesan
router.post('/send-message', async (req, res) => {
  try {
    const { number, message } = req.body;
    const userId = req.session.user.id;
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    
    if (!number || !message) {
      return res.render('send-message', {
        user: req.session.user,
        isConnected: connectionStatus.connected,
        error: 'Nomor dan pesan harus diisi',
        success: null
      });
    }

    await multiTenantWhatsApp.sendMessage(userId, number, message);
    
    res.render('send-message', {
      user: req.session.user,
      isConnected: connectionStatus.connected,
      error: null,
      success: 'Pesan berhasil dikirim'
    });
  } catch (error) {
    console.error('Error sending message:', error);
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    res.render('send-message', {
      user: req.session.user,
      isConnected: connectionStatus.connected,
      error: 'Gagal mengirim pesan: ' + error.message,
      success: null
    });
  }
});

// Halaman daftar grup
router.get('/groups', async (req, res) => {
  try {
    const userId = req.session.user.id;
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    let groups = [];
    let error = null;
    
    if (!connectionStatus.connected) {
      error = 'WhatsApp belum terhubung. Silakan scan QR code terlebih dahulu.';
    } else {
      try {
        groups = await multiTenantWhatsApp.getGroups(userId);
      } catch (err) {
        console.error('Error fetching groups:', err);
        error = 'Gagal mengambil daftar grup: ' + err.message;
      }
    }
    
    res.render('groups', {
      user: req.session.user,
      isConnected: connectionStatus.connected,
      groups,
      error
    });
  } catch (error) {
    console.error('Error loading groups page:', error);
    res.render('groups', {
      user: req.session.user,
      isConnected: false,
      groups: [],
      error: 'Terjadi kesalahan saat memuat halaman grup'
    });
  }
});

// Endpoint untuk connect WhatsApp
router.post('/connect-whatsapp', async (req, res) => {
  try {
    const userId = req.session.user.id;
    await multiTenantWhatsApp.connectWhatsApp(userId);
    res.json({ success: true, message: 'Koneksi WhatsApp dimulai' });
  } catch (error) {
    console.error('Error connecting WhatsApp:', error);
    res.status(500).json({ success: false, message: 'Gagal memulai koneksi WhatsApp' });
  }
});

// Endpoint untuk disconnect WhatsApp
router.post('/disconnect-whatsapp', async (req, res) => {
  try {
    const userId = req.session.user.id;
    await multiTenantWhatsApp.disconnectWhatsApp(userId);
    res.json({ success: true, message: 'WhatsApp berhasil diputus' });
  } catch (error) {
    console.error('Error disconnecting WhatsApp:', error);
    res.status(500).json({ success: false, message: 'Gagal memutus koneksi WhatsApp' });
  }
});

// Endpoint untuk test kirim pesan (tanpa API key)
router.post('/test-send-message', async (req, res) => {
  try {
    const { number, message } = req.body;
    const userId = req.session.user.id;
    
    if (!number || !message) {
      return res.status(400).json({
        success: false,
        message: 'Nomor dan pesan harus diisi'
      });
    }

    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    if (!connectionStatus.connected) {
      return res.status(500).json({
        success: false,
        message: 'WhatsApp tidak terhubung'
      });
    }

    await multiTenantWhatsApp.sendMessage(userId, number, message);
    
    res.json({
      success: true,
      message: 'Pesan berhasil dikirim',
      to: number,
      from: connectionStatus.number,
      timestamp: new Date().toISOString()
    });

  } catch (error) {
    console.error('Error sending test message:', error);
    res.status(500).json({
      success: false,
      message: 'Gagal mengirim pesan: ' + error.message
    });
  }
});

// Halaman dokumentasi API
router.get('/api-docs', (req, res) => {
  res.render('api-docs', {
    user: req.session.user
  });
});

// Halaman generator script PPP
router.get('/ppp-generator', async (req, res) => {
  try {
    const { getGroups, getContacts, isWhatsAppConnected } = require('../utils/whatsappClient');
    const { findById } = require('../models/User');
    
    // Ambil informasi user
    const user = await findById(req.session.user.id);
    
    // Ambil daftar grup dan kontak jika WhatsApp terhubung
    let groups = [];
    let contacts = [];
    
    if (isWhatsAppConnected()) {
      try {
        groups = await getGroups() || [];
        contacts = await getContacts() || [];
      } catch (error) {
        console.error('Error getting groups/contacts:', error);
      }
    }
    
    res.render('ppp-generator', {
      title: 'Generator Script PPP Mikrotik',
      user: req.session.user,
      apiKey: user?.api_key,
      groups: groups,
      contacts: contacts,
      isConnected: isWhatsAppConnected(),
      baseUrl: `${req.protocol}://${req.get('host')}`
    });
  } catch (error) {
    console.error('Error PPP generator page:', error);
    res.render('error', { 
      title: 'Error', 
      message: 'Terjadi kesalahan saat memuat halaman generator',
      error: error 
    });
  }
});

// Regenerate API Key
router.post('/regenerate-api-key', async (req, res) => {
  try {
    const userId = req.session.user.id;
    const newApiKey = await User.updateApiKey(userId);
    
    // Update session
    req.session.user.api_key = newApiKey;
    
    res.json({
      success: true,
      api_key: newApiKey
    });
  } catch (error) {
    console.error('Error regenerating API key:', error);
    res.status(500).json({
      success: false,
      message: 'Gagal generate ulang API Key'
    });
  }
});

// Logout WhatsApp
router.post('/logout-whatsapp', async (req, res) => {
  try {
    const { deleteContacts } = req.body;
    
    // Logout dari WhatsApp
    await logout();
    
    // Hapus kontak jika diminta
    if (deleteContacts) {
      await Contact.deleteAllContacts();
      console.log('Semua kontak berhasil dihapus');
    }
    
    res.json({
      success: true,
      message: 'Berhasil logout dari WhatsApp' + (deleteContacts ? ' dan menghapus kontak' : '')
    });
  } catch (error) {
    console.error('Error saat logout WhatsApp:', error);
    res.status(500).json({
      success: false,
      message: 'Gagal logout dari WhatsApp: ' + error.message
    });
  }
});

module.exports = router; 