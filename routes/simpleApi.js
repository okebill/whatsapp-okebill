const express = require('express');
const router = express.Router();
const { getClient, getConnectionStatus, getGroups } = require('../utils/whatsappClient');
const { apiKeyAuth, logApiUsage } = require('../middleware/apiAuth');
const { SENDER_ID } = require('../config/api');

// Apply middleware untuk semua route di file ini
router.use(logApiUsage);
router.use(apiKeyAuth);

// Format gateway komersial - send-message (seperti contoh Anda)
router.get('/send-message', async (req, res) => {
  const { number, message, sender } = req.query;
  
  if (!number || !message) {
    return res.status(400).json({ 
      success: false, 
      message: 'Parameter number dan message diperlukan' 
    });
  }
  
  try {
    // Pastikan format nomor benar
    let formattedNumber = number;
    
    // Jika nomor sudah dalam format grup (@g.us), gunakan langsung
    if (number.includes('@g.us')) {
      formattedNumber = number;
    } 
    // Jika nomor biasa, format ke nomor WhatsApp
    else if (!number.includes('@')) {
      formattedNumber = `${number.replace(/[^0-9]/g, '')}@c.us`;
    }
    
    const client = getClient();
    if (!client || !getConnectionStatus()) {
      return res.status(500).json({ 
        success: false, 
        message: 'WhatsApp tidak terhubung' 
      });
    }
    
    await client.sendMessage(formattedNumber, { text: message });
    
    res.json({ 
      success: true, 
      message: 'Pesan berhasil dikirim',
      to: formattedNumber,
      from: sender || SENDER_ID,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error sending message:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Gagal mengirim pesan: ' + error.message 
    });
  }
});

// Status endpoint sederhana
router.get('/status', (req, res) => {
  const isConnected = getConnectionStatus();
  
  res.json({
    success: true,
    connected: isConnected,
    sender: SENDER_ID,
    timestamp: new Date().toISOString()
  });
});

// Groups endpoint sederhana
router.get('/groups', (req, res) => {
  const groups = getGroups();
  
  res.json({
    success: true,
    groups: groups,
    total: groups.length,
    timestamp: new Date().toISOString()
  });
});

module.exports = router; 