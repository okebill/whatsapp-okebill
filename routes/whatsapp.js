const express = require('express');
const router = express.Router();
const { getClient, getQR, getConnectionStatus, getGroups } = require('../utils/whatsappClient');
const { isAuthenticated } = require('./auth');

// Dapatkan status koneksi dan QR code
router.get('/status', isAuthenticated, (req, res) => {
  const isConnected = getConnectionStatus();
  const qrCode = getQR();
  
  res.json({
    connected: isConnected,
    qr: qrCode
  });
});

// Dapatkan daftar grup
router.get('/groups', isAuthenticated, (req, res) => {
  const groups = getGroups();
  res.json({ groups });
});

// Kirim pesan ke nomor
router.post('/send-message', isAuthenticated, async (req, res) => {
  const { number, message } = req.body;
  
  if (!number || !message) {
    return res.status(400).json({ success: false, message: 'Nomor dan pesan diperlukan' });
  }
  
  try {
    // Pastikan format nomor benar
    const formattedNumber = number.includes('@c.us') ? number : `${number.replace(/[^0-9]/g, '')}@c.us`;
    
    const client = getClient();
    if (!client || !getConnectionStatus()) {
      return res.status(500).json({ success: false, message: 'WhatsApp tidak terhubung' });
    }
    
    await client.sendMessage(formattedNumber, { text: message });
    res.json({ success: true, message: 'Pesan terkirim' });
  } catch (error) {
    console.error('Error sending message:', error);
    res.status(500).json({ success: false, message: 'Gagal mengirim pesan' });
  }
});

// Kirim pesan ke grup
router.post('/send-group-message', isAuthenticated, async (req, res) => {
  const { groupId, message } = req.body;
  
  if (!groupId || !message) {
    return res.status(400).json({ success: false, message: 'ID grup dan pesan diperlukan' });
  }
  
  try {
    const client = getClient();
    if (!client || !getConnectionStatus()) {
      return res.status(500).json({ success: false, message: 'WhatsApp tidak terhubung' });
    }
    
    await client.sendMessage(groupId, { text: message });
    res.json({ success: true, message: 'Pesan terkirim ke grup' });
  } catch (error) {
    console.error('Error sending message to group:', error);
    res.status(500).json({ success: false, message: 'Gagal mengirim pesan ke grup' });
  }
});

module.exports = router; 