require('dotenv').config();
const express = require('express');
const session = require('express-session');
const path = require('path');
const { connectToWhatsApp } = require('./utils/whatsappClient');

// Import routes
const authRoutes = require('./routes/auth');
const whatsappRoutes = require('./routes/whatsapp');
const dashboardRoutes = require('./routes/dashboard');
const publicApiRoutes = require('./routes/publicApi');
const simpleApiRoutes = require('./routes/simpleApi');

const app = express();
const PORT = process.env.PORT || 1992;

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

app.use(session({
  secret: process.env.SESSION_SECRET || 'whatsapp_api_secret_key',
  resave: false,
  saveUninitialized: false,
  cookie: {
    secure: false, // Set true jika menggunakan HTTPS
    maxAge: 24 * 60 * 60 * 1000 // 24 jam
  }
}));

// Routes
app.use('/auth', authRoutes);
app.use('/api/whatsapp', whatsappRoutes);
app.use('/dashboard', dashboardRoutes);
app.use('/api/public', publicApiRoutes);
app.use('/', simpleApiRoutes);

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

// Koneksi WhatsApp
connectToWhatsApp()
  .then(() => {
    console.log('WhatsApp client initialized');
  })
  .catch(err => {
    console.error('Error initializing WhatsApp client:', err);
  });

// Start server
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server berjalan di http://0.0.0.0:${PORT}`);
  console.log(`Dashboard: http://localhost:${PORT}/dashboard`);
  console.log(`API Docs: http://localhost:${PORT}/dashboard/api-docs`);
}); 