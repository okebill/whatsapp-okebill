const mysql = require('mysql2/promise');
const dbConfig = require('../config/database');

let connection = null;

/**
 * Inisialisasi koneksi database
 */
async function initDB() {
  try {
    connection = await mysql.createConnection(dbConfig);
    console.log('Database Contact terhubung!');
  } catch (error) {
    console.error('Error koneksi database Contact:', error);
    throw error;
  }
}

class Contact {
  /**
   * Ambil semua kontak
   * @returns {Promise<Array>}
   */
  static async getAllContacts() {
    if (!connection) await initDB();
    
    try {
      const [rows] = await connection.execute('SELECT * FROM contacts ORDER BY name ASC');
      return rows;
    } catch (error) {
      console.error('Error mengambil kontak:', error);
      throw error;
    }
  }

  /**
   * Cari kontak berdasarkan whatsapp_id
   * @param {string} whatsappId 
   * @returns {Promise<Object|null>}
   */
  static async findByWhatsappId(whatsappId) {
    if (!connection) await initDB();
    
    try {
      const [rows] = await connection.execute(
        'SELECT * FROM contacts WHERE whatsapp_id = ?',
        [whatsappId]
      );
      return rows[0] || null;
    } catch (error) {
      console.error('Error mencari kontak:', error);
      throw error;
    }
  }

  /**
   * Tambah atau update kontak
   * @param {Object} contact
   * @returns {Promise<Object>} 
   */
  static async upsertContact(contact) {
    if (!connection) await initDB();

    try {
      const {
        name,
        phone,
        whatsapp_id,
        profile_picture,
        is_business,
        status
      } = contact;

      const [result] = await connection.execute(
        `INSERT INTO contacts 
         (name, phone, whatsapp_id, profile_picture, is_business, status) 
         VALUES (?, ?, ?, ?, ?, ?)
         ON DUPLICATE KEY UPDATE
         name = VALUES(name),
         phone = VALUES(phone),
         profile_picture = VALUES(profile_picture),
         is_business = VALUES(is_business),
         status = VALUES(status)`,
        [name, phone, whatsapp_id, profile_picture, is_business, status]
      );

      return result;
    } catch (error) {
      console.error('Error menyimpan kontak:', error);
      throw error;
    }
  }

  /**
   * Hapus kontak berdasarkan whatsapp_id
   * @param {string} whatsappId
   * @returns {Promise<boolean>}
   */
  static async deleteContact(whatsappId) {
    if (!connection) await initDB();

    try {
      const [result] = await connection.execute(
        'DELETE FROM contacts WHERE whatsapp_id = ?',
        [whatsappId]
      );
      return result.affectedRows > 0;
    } catch (error) {
      console.error('Error menghapus kontak:', error);
      throw error;
    }
  }

  /**
   * Hitung total kontak
   * @returns {Promise<number>} Jumlah kontak
   */
  static async getContactCount() {
    if (!connection) await initDB();
    
    try {
      const [rows] = await connection.execute('SELECT COUNT(*) as count FROM contacts');
      return rows[0].count;
    } catch (error) {
      console.error('Error menghitung kontak:', error);
      throw error;
    }
  }

  /**
   * Cari kontak berdasarkan nama atau nomor
   * @param {string} query Query pencarian
   * @returns {Promise<Array>} Hasil pencarian
   */
  static async searchContacts(query) {
    if (!connection) await initDB();
    
    try {
      const [rows] = await connection.execute(
        'SELECT * FROM contacts WHERE name LIKE ? OR phone LIKE ? ORDER BY name ASC',
        [`%${query}%`, `%${query}%`]
      );
      return rows;
    } catch (error) {
      console.error('Error mencari kontak:', error);
      throw error;
    }
  }

  /**
   * Hapus semua kontak
   * @returns {Promise<boolean>} Status hapus
   */
  static async deleteAllContacts() {
    if (!connection) await initDB();
    
    try {
      const [result] = await connection.execute('DELETE FROM contacts');
      return result.affectedRows > 0;
    } catch (error) {
      console.error('Error menghapus semua kontak:', error);
      throw error;
    }
  }
}

module.exports = Contact; 