const User = require('../models/User');

async function createDefaultUser() {
  try {
    // Cek apakah sudah ada user
    const userCount = await User.getUserCount();
    
    if (userCount === 0) {
      // Buat user admin default
      await User.createUser({
        username: 'admin',
        password: 'admin123',
        role: 'admin'
      });
      console.log('User admin default berhasil dibuat');
    } else {
      console.log('User admin sudah ada');
    }
  } catch (error) {
    console.error('Error membuat user default:', error);
    throw error;
  }
}

// Jalankan jika file ini dipanggil langsung
if (require.main === module) {
  createDefaultUser().then(() => {
    console.log('Selesai!');
    process.exit(0);
  });
}

module.exports = createDefaultUser; 