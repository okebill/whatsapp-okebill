const mysql = require('mysql2/promise');
const dbConfig = require('../config/database');

async function checkWhatsAppConnection() {
  console.log('🔍 Checking WhatsApp Connection Status...\n');
  
  try {
    const connection = await mysql.createConnection(dbConfig);
    
    // 1. Cek user dengan API key
    console.log('👤 Checking user with API key...');
    const [users] = await connection.execute(
      'SELECT id, username, api_key, is_active, payment_status FROM users WHERE api_key = ?',
      ['wa_f23d0652_e0a40aa8c6f894670da58205b7271d56']
    );
    
    if (users.length === 0) {
      console.log('❌ No user found with API key: wa_f23d0652_e0a40aa8c6f894670da58205b7271d56');
      
      // Tampilkan semua user yang ada
      console.log('\n📋 Available users:');
      const [allUsers] = await connection.execute('SELECT id, username, api_key, is_active FROM users');
      allUsers.forEach(user => {
        console.log(`- User ID: ${user.id}, Username: ${user.username}, API Key: ${user.api_key}, Active: ${user.is_active}`);
      });
      
      await connection.end();
      return;
    }
    
    const user = users[0];
    console.log('✅ User found:');
    console.log(`- ID: ${user.id}`);
    console.log(`- Username: ${user.username}`);
    console.log(`- Active: ${user.is_active ? 'Yes' : 'No'}`);
    console.log(`- Payment Status: ${user.payment_status}`);
    
    // 2. Cek koneksi WhatsApp untuk user ini
    console.log('\n📱 Checking WhatsApp connection...');
    const [connections] = await connection.execute(
      'SELECT * FROM user_connections WHERE user_id = ?',
      [user.id]
    );
    
    if (connections.length === 0) {
      console.log('❌ No WhatsApp connection record found');
      console.log('Creating connection record...');
      
      await connection.execute(
        'INSERT INTO user_connections (user_id, connection_status, created_at) VALUES (?, ?, NOW())',
        [user.id, 'disconnected']
      );
      
      console.log('✅ Connection record created');
    } else {
      const conn = connections[0];
      console.log('✅ WhatsApp connection record found:');
      console.log(`- Status: ${conn.connection_status}`);
      console.log(`- WhatsApp Number: ${conn.whatsapp_number || 'Not connected'}`);
      console.log(`- Last Connected: ${conn.last_connected || 'Never'}`);
      console.log(`- Last Disconnected: ${conn.last_disconnected || 'Never'}`);
    }
    
    // 3. Cek apakah ada session file
    console.log('\n📂 Checking session files...');
    const fs = require('fs');
    const path = require('path');
    
    const sessionDir = path.join(__dirname, '..', 'sessions', `user_${user.id}`);
    
    if (fs.existsSync(sessionDir)) {
      console.log('✅ Session directory exists:', sessionDir);
      
      const sessionFiles = fs.readdirSync(sessionDir);
      console.log(`- Session files: ${sessionFiles.length} files`);
      
      if (sessionFiles.length > 0) {
        console.log('- Files:', sessionFiles.slice(0, 3).join(', ') + (sessionFiles.length > 3 ? '...' : ''));
      }
    } else {
      console.log('❌ Session directory not found:', sessionDir);
      console.log('Creating session directory...');
      
      fs.mkdirSync(sessionDir, { recursive: true });
      console.log('✅ Session directory created');
    }
    
    // 4. Solusi dan rekomendasi
    console.log('\n🔧 Solutions and Recommendations:');
    
    if (connections.length === 0 || connections[0].connection_status === 'disconnected') {
      console.log('📌 WhatsApp belum terkoneksi. Langkah-langkah:');
      console.log('1. Login ke dashboard: http://localhost:3000');
      console.log('2. Username: admin, Password: admin123');
      console.log('3. Klik "Scan QR Code" untuk koneksi WhatsApp');
      console.log('4. Scan QR code dengan WhatsApp di HP');
      console.log('5. Tunggu sampai status "Connected"');
    } else if (connections[0].connection_status === 'connected') {
      console.log('✅ WhatsApp sudah terkoneksi di database');
      console.log('📌 Jika masih error "WhatsApp tidak terhubung":');
      console.log('1. Restart aplikasi: npm start');
      console.log('2. Cek apakah multiTenantWhatsApp service berjalan');
      console.log('3. Cek log aplikasi untuk error');
    }
    
    await connection.end();
    console.log('\n🎉 WhatsApp connection check completed!');
    
  } catch (error) {
    console.error('❌ Error checking WhatsApp connection:', error);
  }
}

// Export untuk digunakan di modul lain
module.exports = { checkWhatsAppConnection };

// Jalankan jika dipanggil langsung
if (require.main === module) {
  checkWhatsAppConnection();
} 