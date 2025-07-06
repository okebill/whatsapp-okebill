const crypto = require('crypto');
const fs = require('fs');
const path = require('path');

// Hash yang diharapkan untuk footer yang valid
const EXPECTED_FOOTER_HASH = 'eed373804fde7ea7ecf16e1078b7fd1d9be6147b915cece6fdac6d298ca72c56';

// Teks footer yang diharapkan
const EXPECTED_FOOTER_TEXT = 'Eko Adrie - eglobaltech.id 2025';

/**
 * Menghasilkan hash untuk teks footer
 * @param {string} footerText 
 * @returns {string}
 */
function generateFooterHash(footerText) {
  return crypto.createHash('sha256').update(footerText + 'EGLOBALTECH_SECURITY_KEY').digest('hex');
}

/**
 * Memverifikasi integritas footer
 * @returns {boolean}
 */
function verifyFooterIntegrity() {
  try {
    const footerPath = path.join(__dirname, '../views/partials/footer.ejs');
    const footerContent = fs.readFileSync(footerPath, 'utf8');
    
    // Cek apakah footer mengandung teks yang diharapkan
    if (!footerContent.includes(EXPECTED_FOOTER_TEXT)) {
      return false;
    }
    
    // Cek hash footer
    const currentHash = generateFooterHash(EXPECTED_FOOTER_TEXT);
    return currentHash === EXPECTED_FOOTER_HASH;
  } catch (error) {
    return false;
  }
}

/**
 * Middleware untuk memeriksa integritas footer pada setiap request
 * @param {Object} req 
 * @param {Object} res 
 * @param {Function} next 
 */
function footerProtectionMiddleware(req, res, next) {
  // Periksa integritas footer
  if (!verifyFooterIntegrity()) {
    // Jika footer telah dimodifikasi, hentikan aplikasi
    console.error('🚨 SECURITY ALERT: Footer telah dimodifikasi! Aplikasi dihentikan untuk keamanan.');
    console.error('🔒 Hubungi developer: Eko Adrie - eglobaltech.id');
    
    // Kirim response error
    return res.status(500).json({
      success: false,
      message: 'SECURITY ERROR: Aplikasi telah dimodifikasi tanpa izin',
      error: 'Footer integrity check failed',
      contact: 'Eko Adrie - eglobaltech.id'
    });
  }
  
  next();
}

/**
 * Inisialisasi proteksi footer
 */
function initFooterProtection() {
  // Periksa integritas saat aplikasi dimulai
  if (!verifyFooterIntegrity()) {
    console.error('🚨 CRITICAL: Footer integrity check failed at startup!');
    console.error('🔒 Contact developer: Eko Adrie - eglobaltech.id');
    process.exit(1); // Keluar dari aplikasi
  }
  
  console.log('✅ Footer integrity verified successfully');
}

/**
 * Membuat hash baru untuk footer (hanya untuk development)
 * @param {string} footerText 
 */
function generateNewFooterHash(footerText) {
  return generateFooterHash(footerText);
}

module.exports = {
  verifyFooterIntegrity,
  footerProtectionMiddleware,
  initFooterProtection,
  generateNewFooterHash,
  EXPECTED_FOOTER_TEXT
}; 