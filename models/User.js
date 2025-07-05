const db = require('../config/database');
const bcrypt = require('bcryptjs');

class User {
  static async findByUsername(username) {
    try {
      console.log('Mencari user:', username);
      const [rows] = await db.execute('SELECT * FROM users WHERE username = ?', [username]);
      if (rows[0]) {
        console.log('User ditemukan dengan password hash:', rows[0].password);
      }
      return rows[0];
    } catch (error) {
      console.error('Error saat mencari user:', error);
      throw error;
    }
  }

  static async create(username, password) {
    try {
      const hashedPassword = await bcrypt.hash(password, 10);
      const [result] = await db.execute(
        'INSERT INTO users (username, password) VALUES (?, ?)',
        [username, hashedPassword]
      );
      return result.insertId;
    } catch (error) {
      throw error;
    }
  }

  static async verifyPassword(plainPassword, hashedPassword) {
    try {
      console.log('Mencoba verifikasi password:');
      console.log('Password yang diinput:', plainPassword);
      console.log('Password hash dari database:', hashedPassword);
      const isValid = await bcrypt.compare(plainPassword, hashedPassword);
      console.log('Hasil verifikasi bcrypt:', isValid);
      return isValid;
    } catch (error) {
      console.error('Error saat verifikasi password:', error);
      throw error;
    }
  }
}

module.exports = User; 