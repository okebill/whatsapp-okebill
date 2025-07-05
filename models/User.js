const mysql = require('mysql2/promise');
const bcrypt = require('bcryptjs');
const dbConfig = require('../config/database');

let connection = null;

/**
 * Inisialisasi koneksi database
 */
async function initDB() {
  try {
    connection = await mysql.createConnection(dbConfig);
    console.log('Database terhubung!');
  } catch (error) {
    console.error('Error koneksi database:', error);
    throw error;
  }
}

/**
 * Cari user berdasarkan username
 * @param {string} username 
 * @returns {Promise<Object|null>}
 */
async function findByUsername(username) {
  if (!connection) await initDB();
  
  try {
    const [rows] = await connection.execute(
      'SELECT * FROM users WHERE username = ?',
      [username]
    );
    return rows[0] || null;
  } catch (error) {
    console.error('Error mencari user:', error);
    throw error;
  }
}

/**
 * Validasi password
 * @param {string} password Password yang akan divalidasi
 * @param {string} hash Hash password dari database
 * @returns {Promise<boolean>}
 */
async function validatePassword(password, hash) {
  return await bcrypt.compare(password, hash);
}

/**
 * Hash password
 * @param {string} password 
 * @returns {Promise<string>}
 */
async function hashPassword(password) {
  return await bcrypt.hash(password, 10);
}

/**
 * Buat user baru
 * @param {Object} userData 
 * @returns {Promise<Object>}
 */
async function createUser(userData) {
  if (!connection) await initDB();

  const hashedPassword = await hashPassword(userData.password);
  
  try {
    const [result] = await connection.execute(
      'INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)',
      [userData.username, hashedPassword, userData.email, userData.role || 'user']
    );
    
    return {
      id: result.insertId,
      username: userData.username,
      email: userData.email,
      role: userData.role || 'user'
    };
  } catch (error) {
    console.error('Error membuat user:', error);
    throw error;
  }
}

/**
 * Update user
 * @param {number} id 
 * @param {Object} userData 
 * @returns {Promise<Object>}
 */
async function updateUser(id, userData) {
  if (!connection) await initDB();

  const updates = [];
  const values = [];
  
  if (userData.username) {
    updates.push('username = ?');
    values.push(userData.username);
  }
  
  if (userData.email) {
    updates.push('email = ?');
    values.push(userData.email);
  }
  
  if (userData.password) {
    updates.push('password = ?');
    values.push(await hashPassword(userData.password));
  }
  
  if (userData.role) {
    updates.push('role = ?');
    values.push(userData.role);
  }
  
  if (updates.length === 0) return null;
  
  values.push(id);
  
  try {
    const [result] = await connection.execute(
      `UPDATE users SET ${updates.join(', ')} WHERE id = ?`,
      values
    );
    
    if (result.affectedRows === 0) return null;
    
    return {
      id,
      ...userData
    };
  } catch (error) {
    console.error('Error update user:', error);
    throw error;
  }
}

module.exports = {
  initDB,
  findByUsername,
  validatePassword,
  createUser,
  updateUser
}; 