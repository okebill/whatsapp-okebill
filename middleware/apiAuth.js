const { validateApiKey } = require('../config/api');

// Middleware untuk validasi API key
function apiKeyAuth(req, res, next) {
  // Ambil API key dari query parameter atau header
  const apiKey = req.query.api_key || req.headers['x-api-key'] || req.body.api_key;
  
  if (!apiKey) {
    return res.status(401).json({ 
      success: false, 
      message: 'API key diperlukan. Gunakan parameter api_key atau header X-API-Key' 
    });
  }
  
  if (!validateApiKey(apiKey)) {
    return res.status(401).json({ 
      success: false, 
      message: 'API key tidak valid' 
    });
  }
  
  // Jika valid, lanjutkan ke handler berikutnya
  next();
}

// Middleware untuk logging API usage
function logApiUsage(req, res, next) {
  const timestamp = new Date().toISOString();
  const ip = req.ip || req.connection.remoteAddress;
  const userAgent = req.get('User-Agent') || 'Unknown';
  
  console.log(`[API] ${timestamp} - ${ip} - ${req.method} ${req.originalUrl} - ${userAgent}`);
  next();
}

module.exports = {
  apiKeyAuth,
  logApiUsage
}; 