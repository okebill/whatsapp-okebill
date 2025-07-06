const express = require('express');
const router = express.Router();
const multiTenantWhatsApp = require('../utils/multiTenantWhatsApp');
const { requireAuth, requireValidSubscription } = require('../middleware/auth');

// Status WhatsApp (memerlukan auth)
router.get('/status', requireAuth, requireValidSubscription, async (req, res) => {
  try {
    const userId = req.session.user.id;
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    res.json({
      success: true,
      connected: connectionStatus.connected,
      number: connectionStatus.number,
      timestamp: new Date()
    });
  } catch (error) {
    console.error('Error get status:', error);
    res.status(500).json({
      success: false,
      message: 'Terjadi kesalahan saat cek status'
    });
  }
});

// Get QR Code (memerlukan auth)
router.get('/qr', requireAuth, requireValidSubscription, async (req, res) => {
  try {
    const userId = req.session.user.id;
    const qr = multiTenantWhatsApp.getQR(userId);
    if (!qr) {
      return res.status(404).json({
        success: false,
        message: 'QR Code tidak tersedia. Silakan mulai koneksi WhatsApp terlebih dahulu.'
      });
    }
    res.json({
      success: true,
      qr: qr
    });
  } catch (error) {
    console.error('Error get QR:', error);
    res.status(500).json({
      success: false,
      message: 'Terjadi kesalahan saat mengambil QR Code'
    });
  }
});

// Kirim pesan (memerlukan auth)
router.post('/send-message', requireAuth, requireValidSubscription, async (req, res) => {
  try {
    const { number, message } = req.body;
    const userId = req.session.user.id;
    
    if (!number || !message) {
      return res.status(400).json({
        success: false,
        message: 'Nomor dan pesan harus diisi'
      });
    }

    await multiTenantWhatsApp.sendMessage(userId, number, message);
    
    res.json({
      success: true,
      message: 'Pesan berhasil dikirim',
      data: {
        to: number,
        message: message,
        timestamp: new Date()
      }
    });
  } catch (error) {
    console.error('Error send message:', error);
    res.status(500).json({
      success: false,
      message: 'Terjadi kesalahan saat kirim pesan'
    });
  }
});

// Get daftar grup (memerlukan auth)
router.get('/groups', requireAuth, requireValidSubscription, async (req, res) => {
  try {
    const userId = req.session.user.id;
    const groups = await multiTenantWhatsApp.getGroups(userId);
    res.json({
      success: true,
      groups: groups,
      total: groups.length,
      timestamp: new Date()
    });
  } catch (error) {
    console.error('Error get groups:', error);
    res.status(500).json({
      success: false,
      message: 'Terjadi kesalahan saat mengambil daftar grup'
    });
  }
});

module.exports = router; 