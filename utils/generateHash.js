const bcrypt = require('bcryptjs');

async function generateHash() {
    const password = 'admin123'; // ganti dengan password yang Anda inginkan
    const hash = await bcrypt.hash(password, 10);
    console.log('Password:', password);
    console.log('Hash:', hash);
}

generateHash(); 