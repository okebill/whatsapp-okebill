const mysql = require('mysql2/promise');
const dbConfig = require('../config/database');

// Middleware untuk validasi API key dan identifikasi user
async function apiKeyAuth(req, res, next) {
  // Ambil API key dari query parameter atau header
  const apiKey = req.query.api_key || req.headers['x-api-key'] || req.body.api_key;
  
  if (!apiKey) {
    return res.status(401).json({ 
      success: false, 
      message: 'API key diperlukan. Gunakan parameter api_key atau header X-API-Key' 
    });
  }
  
  try {
    // Validasi API key dan dapatkan user
    const connection = await mysql.createConnection(dbConfig);
    
    const [users] = await connection.execute(
      'SELECT id, username, api_key, is_active, payment_status FROM users WHERE api_key = ? AND is_active = 1',
      [apiKey]
    );
    
    await connection.end();
    
    if (users.length === 0) {
      return res.status(401).json({ 
        success: false, 
        message: 'API key tidak valid atau user tidak aktif' 
      });
    }
    
    const user = users[0];
    
    // Cek status pembayaran
    if (user.payment_status === 'expired' || user.payment_status === 'suspended') {
      return res.status(402).json({ 
        success: false, 
        message: 'Akun Anda telah expired atau suspended. Silakan perpanjang langganan.' 
      });
    }
    
    // Tambahkan user ke request object
    req.user = {
      id: user.id,
      username: user.username,
      api_key: user.api_key,
      is_active: user.is_active,
      payment_status: user.payment_status
    };
    
    // Lanjutkan ke handler berikutnya
    next();
    
  } catch (error) {
    console.error('Error validating API key:', error);
    return res.status(500).json({ 
      success: false, 
      message: 'Terjadi kesalahan saat validasi API key' 
    });
  }
}

// Middleware untuk logging API usage
async function logApiUsage(req, res, next) {
  const timestamp = new Date().toISOString();
  const ip = req.ip || req.connection.remoteAddress;
  const userAgent = req.get('User-Agent') || 'Unknown';
  const method = req.method;
  const url = req.originalUrl;
  
  console.log(`[API] ${timestamp} - ${ip} - ${method} ${url} - ${userAgent}`);
  
  // Jika user sudah teridentifikasi, catat API usage ke database
  if (req.user) {
    try {
      const connection = await mysql.createConnection(dbConfig);
      
      await connection.execute(
        `INSERT INTO user_api_usage (user_id, endpoint, method, ip_address, user_agent, request_data, created_at) 
         VALUES (?, ?, ?, ?, ?, ?, NOW())`,
        [
          req.user.id,
          url,
          method,
          ip,
          userAgent,
          JSON.stringify({
            query: req.query,
            body: req.body,
            params: req.params
          })
        ]
      );
      
      await connection.end();
      
    } catch (error) {
      console.error('Error logging API usage:', error);
    }
  }
  
  next();
}

module.exports = {
  apiKeyAuth,
  logApiUsage
}; 