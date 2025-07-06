const mysql = require('mysql2/promise');
const dbConfig = require('../config/database');

let connection = null;

/**
 * Inisialisasi koneksi database
 */
async function initDB() {
  try {
    connection = await mysql.createConnection(dbConfig);
    console.log('MessageStats database terhubung!');
  } catch (error) {
    console.error('Error koneksi MessageStats database:', error);
    throw error;
  }
}

/**
 * Catat pengiriman pesan
 * @param {Object} messageData 
 * @returns {Promise<Object>}
 */
async function recordMessage(messageData) {
  if (!connection) await initDB();
  
  try {
    const {
      userId,
      senderNumber,
      targetNumber,
      messageLength,
      success = true,
      errorMessage = null
    } = messageData;
    
    // Tentukan tipe target (personal atau group)
    const targetType = targetNumber.includes('@g.us') ? 'group' : 'personal';
    
    const [result] = await connection.execute(
      `INSERT INTO message_stats 
       (user_id, sender_number, target_number, target_type, message_length, success, error_message) 
       VALUES (?, ?, ?, ?, ?, ?, ?)`,
      [userId, senderNumber, targetNumber, targetType, messageLength, success, errorMessage]
    );
    
    return {
      id: result.insertId,
      ...messageData,
      targetType
    };
  } catch (error) {
    console.error('Error recording message:', error);
    throw error;
  }
}

/**
 * Ambil statistik pesan untuk user
 * @param {number} userId 
 * @returns {Promise<Object>}
 */
async function getUserMessageStats(userId) {
  if (!connection) await initDB();
  
  try {
    const userIdInt = parseInt(userId);
    
    // Total pesan hari ini
    const [todayStats] = await connection.execute(
      `SELECT 
         COUNT(*) as total_today,
         COUNT(CASE WHEN success = 1 THEN 1 END) as success_today,
         COUNT(CASE WHEN success = 0 THEN 1 END) as failed_today,
         COUNT(CASE WHEN target_type = 'personal' THEN 1 END) as personal_today,
         COUNT(CASE WHEN target_type = 'group' THEN 1 END) as group_today
       FROM message_stats 
       WHERE user_id = ? AND DATE(sent_at) = CURDATE()`,
      [userIdInt]
    );
    
    // Total pesan minggu ini
    const [weekStats] = await connection.execute(
      `SELECT 
         COUNT(*) as total_week,
         COUNT(CASE WHEN success = 1 THEN 1 END) as success_week,
         COUNT(CASE WHEN success = 0 THEN 1 END) as failed_week
       FROM message_stats 
       WHERE user_id = ? AND YEARWEEK(sent_at) = YEARWEEK(NOW())`,
      [userIdInt]
    );
    
    // Total pesan bulan ini
    const [monthStats] = await connection.execute(
      `SELECT 
         COUNT(*) as total_month,
         COUNT(CASE WHEN success = 1 THEN 1 END) as success_month,
         COUNT(CASE WHEN success = 0 THEN 1 END) as failed_month
       FROM message_stats 
       WHERE user_id = ? AND YEAR(sent_at) = YEAR(NOW()) AND MONTH(sent_at) = MONTH(NOW())`,
      [userIdInt]
    );
    
    // Total keseluruhan
    const [allTimeStats] = await connection.execute(
      `SELECT 
         COUNT(*) as total_all,
         COUNT(CASE WHEN success = 1 THEN 1 END) as success_all,
         COUNT(CASE WHEN success = 0 THEN 1 END) as failed_all,
         COUNT(CASE WHEN target_type = 'personal' THEN 1 END) as personal_all,
         COUNT(CASE WHEN target_type = 'group' THEN 1 END) as group_all,
         MIN(sent_at) as first_message,
         MAX(sent_at) as last_message
       FROM message_stats 
       WHERE user_id = ?`,
      [userIdInt]
    );
    
    return {
      today: todayStats[0] || {},
      week: weekStats[0] || {},
      month: monthStats[0] || {},
      allTime: allTimeStats[0] || {}
    };
  } catch (error) {
    console.error('Error getting user message stats:', error);
    throw error;
  }
}

/**
 * Ambil statistik pesan per hari (7 hari terakhir)
 * @param {number} userId 
 * @returns {Promise<Array>}
 */
async function getDailyStats(userId) {
  if (!connection) await initDB();
  
  try {
    const userIdInt = parseInt(userId);
    
    // Gunakan connection.query untuk INTERVAL parameter
    const [dailyStats] = await connection.query(
      `SELECT 
         DATE(sent_at) as date,
         COUNT(*) as total,
         COUNT(CASE WHEN success = 1 THEN 1 END) as success,
         COUNT(CASE WHEN success = 0 THEN 1 END) as failed,
         COUNT(CASE WHEN target_type = 'personal' THEN 1 END) as personal,
         COUNT(CASE WHEN target_type = 'group' THEN 1 END) as group_msg
       FROM message_stats 
       WHERE user_id = ? AND sent_at >= DATE_SUB(NOW(), INTERVAL ? DAY)
       GROUP BY DATE(sent_at)
       ORDER BY DATE(sent_at) DESC`,
      [userIdInt, 7]
    );
    
    return dailyStats;
  } catch (error) {
    console.error('Error getting daily stats:', error);
    throw error;
  }
}

/**
 * Ambil pesan terakhir yang dikirim
 * @param {number} userId 
 * @param {number} limit 
 * @returns {Promise<Array>}
 */
async function getRecentMessages(userId, limit = 10) {
  if (!connection) await initDB();
  
  try {
    // Pastikan limit adalah integer
    const limitInt = parseInt(limit) || 10;
    const userIdInt = parseInt(userId);
    
    // Gunakan connection.query untuk LIMIT parameter
    const [recentMessages] = await connection.query(
      `SELECT 
         target_number,
         target_type,
         message_length,
         success,
         error_message,
         sent_at
       FROM message_stats 
       WHERE user_id = ?
       ORDER BY sent_at DESC
       LIMIT ?`,
      [userIdInt, limitInt]
    );
    
    return recentMessages;
  } catch (error) {
    console.error('Error getting recent messages:', error);
    throw error;
  }
}

/**
 * Hapus statistik lama (lebih dari X hari)
 * @param {number} days 
 * @returns {Promise<number>}
 */
async function cleanOldStats(days = 30) {
  if (!connection) await initDB();
  
  try {
    const daysInt = parseInt(days) || 30;
    
    // Gunakan connection.query untuk INTERVAL parameter
    const [result] = await connection.query(
      `DELETE FROM message_stats WHERE sent_at < DATE_SUB(NOW(), INTERVAL ? DAY)`,
      [daysInt]
    );
    
    return result.affectedRows;
  } catch (error) {
    console.error('Error cleaning old stats:', error);
    throw error;
  }
}

module.exports = {
  initDB,
  recordMessage,
  getUserMessageStats,
  getDailyStats,
  getRecentMessages,
  cleanOldStats
}; 