require('dotenv').config();
const express = require('express');
const session = require('express-session');
const path = require('path');
const { connectToWhatsApp } = require('./utils/whatsappClient');
const createDefaultUser = require('./utils/createDefaultUser');
const { footerProtectionMiddleware, initFooterProtection } = require('./utils/footerProtection');
const multiTenantWhatsApp = require('./utils/multiTenantWhatsApp');
const { flashMessage } = require('./middleware/auth');
const { addAdminNotifications } = require('./middleware/adminNotification');

// Import routes
const authRoutes = require('./routes/auth');
const whatsappRoutes = require('./routes/whatsapp');
const dashboardRoutes = require('./routes/dashboard');
const publicApiRoutes = require('./routes/publicApi');
const simpleApiRoutes = require('./routes/simpleApi');
const contactsRoutes = require('./routes/contacts');
const adminRoutes = require('./routes/admin');

const app = express();
const PORT = process.env.PORT || 3000;

// Set view engine
app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

// Middleware
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Favicon handler (before session middleware)
app.get('/favicon.ico', (req, res) => {
  res.status(204).end();
});

// Footer protection middleware (check on every request)
app.use(footerProtectionMiddleware);

app.use(session({
  secret: process.env.SESSION_SECRET || 'whatsapp_api_secret_key',
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: false, // Set true jika menggunakan HTTPS
    maxAge: 24 * 60 * 60 * 1000 // 24 jam
  }
}));

// Flash message middleware
app.use(flashMessage);

// Admin notification middleware
app.use(addAdminNotifications);

// Routes
app.use('/auth', authRoutes);
app.use('/dashboard', dashboardRoutes);
app.use('/contacts', contactsRoutes);
app.use('/admin', adminRoutes);
app.use('/api', whatsappRoutes);
app.use('/public-api', publicApiRoutes);
app.use('/simple-api', simpleApiRoutes);

// Route langsung untuk send-message (format gateway komersial)
app.get('/send-message', async (req, res) => {
  const { api_key, sender, number, message } = req.query;
  
  // Validasi API key
  if (!api_key) {
    return res.status(401).json({ 
      success: false, 
      message: 'API key diperlukan' 
    });
  }
  
  // Validasi parameter wajib
  if (!sender || !number || !message) {
    return res.status(400).json({ 
      success: false, 
      message: 'Parameter sender, number, dan message diperlukan' 
    });
  }
  
  try {
    // Import model untuk validasi API key
    const { findByUsername } = require('./models/User');
    const MessageStats = require('./models/MessageStats');
    
    // Validasi API key (untuk sementara gunakan user admin)
    const user = await findByUsername('admin');
    if (!user || user.api_key !== api_key) {
      return res.status(401).json({ 
        success: false, 
        message: 'API key tidak valid' 
      });
    }
    
    // Import WhatsApp client
    const { getClient, isWhatsAppConnected, getConnectedNumber } = require('./utils/whatsappClient');
    
    // Cek koneksi WhatsApp
    if (!isWhatsAppConnected()) {
      return res.status(500).json({ 
        success: false, 
        message: 'WhatsApp tidak terhubung' 
      });
    }
    
    // Format nomor tujuan
    let formattedNumber = number;
    
    // Jika nomor sudah dalam format grup (@g.us), gunakan langsung
    if (number.includes('@g.us')) {
      formattedNumber = number;
    } 
    // Jika nomor biasa, format ke nomor WhatsApp
    else if (!number.includes('@')) {
      formattedNumber = `${number.replace(/[^0-9]/g, '')}@c.us`;
    }
    
    // Kirim pesan
    const client = getClient();
    await client.sendMessage(formattedNumber, { text: message });
    
    // Catat statistik pesan
    try {
      const connectedNumber = getConnectedNumber();
      await MessageStats.recordMessage({
        userId: user.id,
        senderNumber: connectedNumber || sender,
        targetNumber: formattedNumber,
        messageLength: message.length,
        success: true
      });
    } catch (statsError) {
      console.error('Error recording message stats:', statsError);
    }
    
    // Log penggunaan API
    console.log(`API Usage: ${req.ip} - Sender: ${sender} - To: ${formattedNumber} - Message: ${message.substring(0, 50)}...`);
    
    res.json({ 
      success: true, 
      message: 'Pesan berhasil dikirim',
      sender: sender,
      to: formattedNumber,
      timestamp: new Date().toISOString()
    });
  } catch (error) {
    console.error('Error sending message:', error);
    
    // Catat statistik pesan gagal
    try {
      const { findByUsername } = require('./models/User');
      const MessageStats = require('./models/MessageStats');
      const { getConnectedNumber } = require('./utils/whatsappClient');
      
      const user = await findByUsername('admin');
      if (user) {
        const connectedNumber = getConnectedNumber();
        await MessageStats.recordMessage({
          userId: user.id,
          senderNumber: connectedNumber || sender,
          targetNumber: formattedNumber,
          messageLength: message.length,
          success: false,
          errorMessage: error.message
        });
      }
    } catch (statsError) {
      console.error('Error recording failed message stats:', statsError);
    }
    
    res.status(500).json({ 
      success: false, 
      message: 'Gagal mengirim pesan: ' + error.message 
    });
  }
});

// Redirect ke halaman login untuk root path
app.get('/', (req, res, next) => {
  // Jika ada query parameter (api call), lewatkan ke handler API
  if (Object.keys(req.query).length > 0) {
    return next();
  }
  // Jika tidak, redirect ke login
  res.redirect('/auth/login');
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error('Error:', err);
  
  // Jika request untuk API, kirim JSON response
  if (req.path.startsWith('/api/') || req.xhr || req.headers.accept?.indexOf('json') > -1) {
    return res.status(500).json({
      success: false,
      message: 'Terjadi kesalahan server'
    });
  }
  
  // Jika request untuk web, redirect ke error page atau login
  res.status(500).render('error', {
    error: 'Terjadi kesalahan server',
    message: err.message
  });
});

// 404 handler
app.use((req, res) => {
  // Jika request untuk API, kirim JSON response
  if (req.path.startsWith('/api/') || req.xhr || req.headers.accept?.indexOf('json') > -1) {
    return res.status(404).json({
      success: false,
      message: 'Endpoint tidak ditemukan'
    });
  }
  
  // Jika request untuk web, redirect ke login
  res.redirect('/auth/login');
});

// Start server
app.listen(PORT, '0.0.0.0', async () => {
  console.log(`Server berjalan di http://0.0.0.0:${PORT}`);
  console.log(`Dashboard: http://localhost:${PORT}/dashboard`);
  console.log(`API Docs: http://localhost:${PORT}/dashboard/api-docs`);
  
  // Initialize footer protection
  try {
    initFooterProtection();
  } catch (error) {
    console.error('Footer protection failed:', error);
    process.exit(1);
  }
  
  // Buat user default jika belum ada
  try {
    await createDefaultUser();
  } catch (error) {
    console.error('Error creating default user:', error);
  }
  
  // Inisialisasi WhatsApp client
  try {
    await connectToWhatsApp();
  } catch (error) {
    console.error('Error initializing WhatsApp client:', error);
  }
}); 