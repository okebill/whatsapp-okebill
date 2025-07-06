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
      'SELECT id, username, password, api_key, role, is_active, payment_status, subscription_type, expired_date, email FROM users WHERE username = ?',
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
      'INSERT INTO users (username, password, role) VALUES (?, ?, ?)',
      [userData.username, hashedPassword, userData.role || 'user']
    );
    
    return {
      id: result.insertId,
      username: userData.username,
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

/**
 * Ambil user berdasarkan ID
 * @param {number} id 
 * @returns {Promise<Object|null>}
 */
async function findById(id) {
  if (!connection) await initDB();
  
  try {
    const [rows] = await connection.execute(
      'SELECT * FROM users WHERE id = ?',
      [id]
    );
    return rows[0] || null;
  } catch (error) {
    console.error('Error mencari user by ID:', error);
    throw error;
  }
}

/**
 * Hitung total user
 * @returns {Promise<number>}
 */
async function getUserCount() {
  if (!connection) await initDB();
  
  try {
    const [rows] = await connection.execute('SELECT COUNT(*) as count FROM users');
    return rows[0].count;
  } catch (error) {
    console.error('Error hitung user:', error);
    throw error;
  }
}

/**
 * Update API Key user
 * @param {number} userId 
 * @returns {Promise<string>} API Key baru
 */
async function updateApiKey(userId) {
  if (!connection) await initDB();
  
  try {
    const newApiKey = require('../utils/generateApiKey').generateApiKey();
    
    await connection.execute(
      'UPDATE users SET api_key = ? WHERE id = ?',
      [newApiKey, userId]
    );
    
    return newApiKey;
  } catch (error) {
    console.error('Error update API Key:', error);
    throw error;
  }
}

/**
 * Generate API Key berdasarkan device info
 * @param {number} userId 
 * @param {string} deviceId - ID device WhatsApp
 * @param {string} deviceName - Nama device WhatsApp
 * @returns {Promise<string>} API Key baru
 */
async function generateDeviceApiKey(userId, deviceId, deviceName) {
  if (!connection) await initDB();
  
  try {
    // Generate API key yang unik berdasarkan device
    const crypto = require('crypto');
    const timestamp = Date.now();
    const deviceHash = crypto.createHash('sha256').update(deviceId + deviceName + timestamp).digest('hex').substring(0, 8);
    const randomPart = crypto.randomBytes(16).toString('hex');
    const newApiKey = `wa_${deviceHash}_${randomPart}`;
    
    // Update API key di database
    await connection.execute(
      'UPDATE users SET api_key = ?, whatsapp_device_id = ?, whatsapp_device_name = ?, last_connected = NOW() WHERE id = ?',
      [newApiKey, deviceId, deviceName, userId]
    );
    
    console.log(`API Key baru dibuat untuk device ${deviceName} (${deviceId}): ${newApiKey}`);
    return newApiKey;
  } catch (error) {
    console.error('Error generate device API Key:', error);
    throw error;
  }
}

/**
 * Ambil informasi device yang terhubung
 * @param {number} userId 
 * @returns {Promise<Object|null>}
 */
async function getDeviceInfo(userId) {
  if (!connection) await initDB();
  
  try {
    const [rows] = await connection.execute(
      'SELECT whatsapp_device_id, whatsapp_device_name, last_connected FROM users WHERE id = ?',
      [userId]
    );
    return rows[0] || null;
  } catch (error) {
    console.error('Error get device info:', error);
    throw error;
  }
}

module.exports = {
  initDB,
  findByUsername,
  validatePassword,
  createUser,
  updateUser,
  findById,
  getUserCount,
  updateApiKey,
  generateDeviceApiKey,
  getDeviceInfo
}; 