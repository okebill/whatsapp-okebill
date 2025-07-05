const express = require('express');
const router = express.Router();
const { getClient, getConnectionStatus, getQR, sendMessage, getGroups } = require('../utils/whatsappClient');
const { isAuthenticated } = require('../middleware/auth');

// Status WhatsApp
router.get('/status', async (req, res) => {
  try {
    const status = getConnectionStatus();
    res.json({
      success: true,
      connected: status,
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

// Get QR Code
router.get('/qr', async (req, res) => {
  try {
    const qr = getQR();
    if (!qr) {
      return res.status(404).json({
        success: false,
        message: 'QR Code tidak tersedia'
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

// Kirim pesan
router.post('/send-message', async (req, res) => {
  try {
    const { number, message } = req.body;
    
    if (!number || !message) {
      return res.status(400).json({
        success: false,
        message: 'Nomor dan pesan harus diisi'
      });
    }

    await sendMessage(number, message);
    
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

// Get daftar grup
router.get('/groups', async (req, res) => {
  try {
    const groups = await getGroups();
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