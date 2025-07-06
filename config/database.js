require('dotenv').config();

module.exports = {
  // === VPS DATABASE CONFIGURATION ===
  // Update nilai-nilai di bawah ini sesuai dengan VPS Anda
  
  host: process.env.DB_HOST || 'localhost',        // IP VPS atau 'localhost'
  user: process.env.DB_USER || 'root',             // Username MySQL VPS
  password: process.env.DB_PASS || '',             // Password MySQL VPS
  database: process.env.DB_NAME || 'wabot_api',    // Nama database (default: wabot_api)
  port: process.env.DB_PORT || 3306,               // Port MySQL (default: 3306)
  
  // === CONNECTION POOL SETTINGS ===
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  
  // === SSL SETTINGS (jika diperlukan) ===
  // ssl: {
  //   rejectUnauthorized: false
  // }
}; 