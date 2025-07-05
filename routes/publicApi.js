const express = require('express');
const router = express.Router();
const { getClient, getConnectionStatus, getGroups } = require('../utils/whatsappClient');
const { apiKeyAuth, logApiUsage } = require('../middleware/apiAuth');
const { SENDER_ID } = require('../config/api');

// Apply middleware untuk semua route di file ini
router.use(logApiUsage);
router.use(apiKeyAuth);

// Status koneksi WhatsApp
router.get('/status', (req, res) => {
  const isConnected = getConnectionStatus();
  
  res.json({
    success: true,
    connected: isConnected,
    sender: SENDER_ID,
    timestamp: new Date().toISOString()
  });
});

// Daftar grup WhatsApp
router.get('/groups', (req, res) => {
  const groups = getGroups();
  
  res.json({
    success: true,
    groups: groups,
    total: groups.length,
    timestamp: new Date().toISOString()
  });
});

// Kirim pesan ke nomor (format URL parameter) - Format gateway komersial
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
    if (!number.includes('@')) {
      formattedNumber = number.includes('@c.us') ? number : `${number.replace(/[^0-9]/g, '')}@c.us`;
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

// Kirim pesan ke nomor (format POST)
router.post('/send-message', async (req, res) => {
  const { number, message, sender } = req.body;
  
  if (!number || !message) {
    return res.status(400).json({ 
      success: false, 
      message: 'Parameter number dan message diperlukan' 
    });
  }
  
  try {
    // Pastikan format nomor benar
    let formattedNumber = number;
    if (!number.includes('@')) {
      formattedNumber = number.includes('@c.us') ? number : `${number.replace(/[^0-9]/g, '')}@c.us`;
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

// Kirim pesan ke grup (format URL parameter)
router.get('/send-group-message', async (req, res) => {
  const { groupId, message, sender } = req.query;
  
  if (!groupId || !message) {
    return res.status(400).json({ 
      success: false, 
      message: 'Parameter groupId dan message diperlukan' 
    });
  }
  
  try {
    const client = getClient();
    if (!client || !getConnectionStatus()) {
      return res.status(500).json({ 
        success: false, 
        message: 'WhatsApp tidak terhubung' 
      });
    }
    
    await client.sendMessage(groupId, { text: message });
    
    res.json({ 
      success: true, 
      message: 'Pesan berhasil dikirim ke grup',
      to: groupId,
      from: sender || SENDER_ID,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error sending message to group:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Gagal mengirim pesan ke grup: ' + error.message 
    });
  }
});

// Kirim pesan ke grup (format POST)
router.post('/send-group-message', async (req, res) => {
  const { groupId, message, sender } = req.body;
  
  if (!groupId || !message) {
    return res.status(400).json({ 
      success: false, 
      message: 'Parameter groupId dan message diperlukan' 
    });
  }
  
  try {
    const client = getClient();
    if (!client || !getConnectionStatus()) {
      return res.status(500).json({ 
        success: false, 
        message: 'WhatsApp tidak terhubung' 
      });
    }
    
    await client.sendMessage(groupId, { text: message });
    
    res.json({ 
      success: true, 
      message: 'Pesan berhasil dikirim ke grup',
      to: groupId,
      from: sender || SENDER_ID,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error sending message to group:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Gagal mengirim pesan ke grup: ' + error.message 
    });
  }
});

module.exports = router; 