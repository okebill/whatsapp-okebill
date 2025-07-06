const express = require('express');
const router = express.Router();
const multiTenantWhatsApp = require('../utils/multiTenantWhatsApp');
const { apiKeyAuth, logApiUsage } = require('../middleware/apiAuth');
const { SENDER_ID } = require('../config/api');
const MessageStats = require('../models/MessageStats');

// Apply middleware untuk semua route di file ini
router.use(logApiUsage);
router.use(apiKeyAuth);

// Status koneksi WhatsApp
router.get('/status', (req, res) => {
  const userId = req.user.id;
  const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
  
  res.json({
    success: true,
    connected: connectionStatus.connected,
    sender: connectionStatus.number || SENDER_ID,
    timestamp: new Date().toISOString()
  });
});

// Daftar grup WhatsApp
router.get('/groups', async (req, res) => {
  try {
    const userId = req.user.id;
    const groups = await multiTenantWhatsApp.getGroups(userId);
    
    res.json({
      success: true,
      groups: groups,
      total: groups.length,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error getting groups:', error);
    res.status(500).json({
      success: false,
      message: 'Gagal mengambil daftar grup'
    });
  }
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
    const userId = req.user.id;
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    
    // Pastikan format nomor benar
    let formattedNumber = number;
    if (!number.includes('@')) {
      formattedNumber = number.includes('@c.us') ? number : `${number.replace(/[^0-9]/g, '')}@c.us`;
    }
    
    if (!connectionStatus.connected) {
      return res.status(500).json({ 
        success: false, 
        message: 'WhatsApp tidak terhubung' 
      });
    }
    
    await multiTenantWhatsApp.sendMessage(userId, formattedNumber, message);
    
    // Catat statistik pesan
    try {
      await MessageStats.recordMessage({
        userId: userId,
        senderNumber: connectionStatus.number || sender || SENDER_ID,
        targetNumber: formattedNumber,
        messageLength: message.length,
        success: true
      });
    } catch (statsError) {
      console.error('Error recording message stats:', statsError);
    }
    
    res.json({ 
      success: true, 
      message: 'Pesan berhasil dikirim',
      to: formattedNumber,
      from: connectionStatus.number || sender || SENDER_ID,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error sending message:', error);
    
    // Catat statistik pesan gagal
    try {
      const userId = req.user.id;
      const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
      await MessageStats.recordMessage({
        userId: userId,
        senderNumber: connectionStatus.number || sender || SENDER_ID,
        targetNumber: formattedNumber,
        messageLength: message.length,
        success: false,
        errorMessage: error.message
      });
    } catch (statsError) {
      console.error('Error recording failed message stats:', statsError);
    }
    
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
    const userId = req.user.id;
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    
    // Pastikan format nomor benar
    let formattedNumber = number;
    if (!number.includes('@')) {
      formattedNumber = number.includes('@c.us') ? number : `${number.replace(/[^0-9]/g, '')}@c.us`;
    }
    
    if (!connectionStatus.connected) {
      return res.status(500).json({ 
        success: false, 
        message: 'WhatsApp tidak terhubung' 
      });
    }
    
    await multiTenantWhatsApp.sendMessage(userId, formattedNumber, message);
    
    // Catat statistik pesan
    try {
      await MessageStats.recordMessage({
        userId: userId,
        senderNumber: connectionStatus.number || sender || SENDER_ID,
        targetNumber: formattedNumber,
        messageLength: message.length,
        success: true
      });
    } catch (statsError) {
      console.error('Error recording message stats:', statsError);
    }
    
    res.json({ 
      success: true, 
      message: 'Pesan berhasil dikirim',
      to: formattedNumber,
      from: connectionStatus.number || sender || SENDER_ID,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error sending message:', error);
    
    // Catat statistik pesan gagal
    try {
      const userId = req.user.id;
      const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
      await MessageStats.recordMessage({
        userId: userId,
        senderNumber: connectionStatus.number || sender || SENDER_ID,
        targetNumber: formattedNumber,
        messageLength: message.length,
        success: false,
        errorMessage: error.message
      });
    } catch (statsError) {
      console.error('Error recording failed message stats:', statsError);
    }
    
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
    const userId = req.user.id;
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    
    if (!connectionStatus.connected) {
      return res.status(500).json({ 
        success: false, 
        message: 'WhatsApp tidak terhubung' 
      });
    }
    
    await multiTenantWhatsApp.sendMessage(userId, groupId, message);
    
    // Catat statistik pesan grup
    try {
      await MessageStats.recordMessage({
        userId: userId,
        senderNumber: connectionStatus.number || sender || SENDER_ID,
        targetNumber: groupId,
        messageLength: message.length,
        success: true
      });
    } catch (statsError) {
      console.error('Error recording group message stats:', statsError);
    }
    
    res.json({ 
      success: true, 
      message: 'Pesan berhasil dikirim ke grup',
      to: groupId,
      from: connectionStatus.number || sender || SENDER_ID,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error sending message to group:', error);
    
    // Catat statistik pesan grup gagal
    try {
      const userId = req.user.id;
      const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
      await MessageStats.recordMessage({
        userId: userId,
        senderNumber: connectionStatus.number || sender || SENDER_ID,
        targetNumber: groupId,
        messageLength: message.length,
        success: false,
        errorMessage: error.message
      });
    } catch (statsError) {
      console.error('Error recording failed group message stats:', statsError);
    }
    
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
    const userId = req.user.id;
    const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
    
    if (!connectionStatus.connected) {
      return res.status(500).json({ 
        success: false, 
        message: 'WhatsApp tidak terhubung' 
      });
    }
    
    await multiTenantWhatsApp.sendMessage(userId, groupId, message);
    
    // Catat statistik pesan grup
    try {
      await MessageStats.recordMessage({
        userId: userId,
        senderNumber: connectionStatus.number || sender || SENDER_ID,
        targetNumber: groupId,
        messageLength: message.length,
        success: true
      });
    } catch (statsError) {
      console.error('Error recording group message stats:', statsError);
    }
    
    res.json({ 
      success: true, 
      message: 'Pesan berhasil dikirim ke grup',
      to: groupId,
      from: connectionStatus.number || sender || SENDER_ID,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error sending message to group:', error);
    
    // Catat statistik pesan grup gagal
    try {
      const userId = req.user.id;
      const connectionStatus = multiTenantWhatsApp.getConnectionStatus(userId);
      await MessageStats.recordMessage({
        userId: userId,
        senderNumber: connectionStatus.number || sender || SENDER_ID,
        targetNumber: groupId,
        messageLength: message.length,
        success: false,
        errorMessage: error.message
      });
    } catch (statsError) {
      console.error('Error recording failed group message stats:', statsError);
    }
    
    res.status(500).json({ 
      success: false, 
      message: 'Gagal mengirim pesan ke grup: ' + error.message 
    });
  }
});

module.exports = router; 