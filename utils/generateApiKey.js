const crypto = require('crypto');
const fs = require('fs');
const path = require('path');

/**
 * Generate API key yang unik
 * @returns {string} API key yang di-generate
 */
function generateApiKey() {
  return crypto.randomBytes(16).toString('hex');
}

/**
 * Update file .env dengan API key baru
 * @param {string} apiKey - API key yang akan ditambahkan
 */
function updateEnvFile(apiKey) {
  const envPath = path.join(process.cwd(), '.env');
  const envExamplePath = path.join(process.cwd(), '.env.example');
  
  // Baca template dari .env.example jika ada
  let envContent = '';
  if (fs.existsSync(envExamplePath)) {
    envContent = fs.readFileSync(envExamplePath, 'utf8');
  }

  // Cek apakah .env sudah ada
  if (fs.existsSync(envPath)) {
    envContent = fs.readFileSync(envPath, 'utf8');
  }

  // Update atau tambah API_KEY
  if (envContent.includes('API_KEY=')) {
    envContent = envContent.replace(/API_KEY=.*/, `API_KEY=${apiKey}`);
  } else {
    envContent += `\nAPI_KEY=${apiKey}`;
  }

  // Tulis ke file .env
  fs.writeFileSync(envPath, envContent.trim() + '\n');
  
  console.log('\n✅ API Key berhasil di-generate dan disimpan di .env');
  console.log(`🔑 API Key baru Anda: ${apiKey}`);
  console.log('⚠️ Simpan API Key ini di tempat yang aman!\n');
}

// Jika file dijalankan langsung (bukan di-require)
if (require.main === module) {
  const apiKey = generateApiKey();
  updateEnvFile(apiKey);
}

module.exports = {
  generateApiKey,
  updateEnvFile
}; 