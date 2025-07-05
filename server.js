require('dotenv').config();
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');
const path = require('path');
const { connectToWhatsApp } = require('./utils/whatsappClient');
const authRoutes = require('./routes/auth').router;
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
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(session({
  secret: process.env.SESSION_SECRET || 'secret',
  resave: true,
  saveUninitialized: true
}));

// Routes
app.use('/auth', authRoutes);
app.use('/api/whatsapp', whatsappRoutes);
app.use('/dashboard', dashboardRoutes);
app.use('/api/public', publicApiRoutes);
app.use('/', simpleApiRoutes);

// Redirect ke halaman login (hanya untuk root path tanpa parameter)
app.get('/', (req, res, next) => {
  // Jika ada query parameter (api call), lewatkan ke handler API
  if (Object.keys(req.query).length > 0) {
    return next();
  }
  // Jika tidak, redirect ke login
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
}); 