require('dotenv').config();

module.exports = {
  // API Key untuk akses eksternal
  API_KEY: process.env.API_KEY || '5MOPBXcz5hFXiDjPdL71uXakbckjjY',
  SENDER_ID: process.env.SENDER_ID || '385951688360',
  
  // Validasi API key
  validateApiKey: (providedKey) => {
    return providedKey === module.exports.API_KEY;
  }
}; 