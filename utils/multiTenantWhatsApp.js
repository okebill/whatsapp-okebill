const { makeWASocket, DisconnectReason, useMultiFileAuthState, delay } = require('@whiskeysockets/baileys');
const { Boom } = require('@hapi/boom');
const pino = require('pino');
const fs = require('fs');
const path = require('path');
const QRCode = require('qrcode');
const mysql = require('mysql2/promise');
const dbConfig = require('../config/database');

class MultiTenantWhatsApp {
  constructor() {
    this.connections = new Map(); // userId -> connection
    this.qrCodes = new Map(); // userId -> qrCode
    this.connectionStatus = new Map(); // userId -> status
    this.reconnectAttempts = new Map(); // userId -> attempts
    this.maxReconnectAttempts = 5;
  }

  // Get database connection
  async getDbConnection() {
    return await mysql.createConnection(dbConfig);
  }

  // Get user session directory
  getUserSessionDir(userId) {
    const sessionDir = path.join(__dirname, '../sessions', `user_${userId}`);
    if (!fs.existsSync(sessionDir)) {
      fs.mkdirSync(sessionDir, { recursive: true });
    }
    return sessionDir;
  }

  // Create logger for user
  createUserLogger(userId) {
    return pino({
      level: 'warn'
    }).child({ userId });
  }

  // Update user connection status in database
  async updateConnectionStatus(userId, status, whatsappNumber = null, deviceInfo = null) {
    try {
      const connection = await this.getDbConnection();
      
      await connection.execute(
        `UPDATE user_connections SET 
         connection_status = ?, 
         whatsapp_number = ?, 
         device_info = ?,
         last_connected = CASE WHEN ? = 'connected' THEN NOW() ELSE last_connected END,
         last_disconnected = CASE WHEN ? = 'disconnected' THEN NOW() ELSE last_disconnected END,
         updated_at = NOW()
         WHERE user_id = ?`,
        [status, whatsappNumber, deviceInfo ? JSON.stringify(deviceInfo) : null, status, status, userId]
      );
      
      await connection.end();
      
      // Update local status
      this.connectionStatus.set(userId, status);
      
    } catch (error) {
      console.error(`Error updating connection status for user ${userId}:`, error);
    }
  }

  // Connect WhatsApp for specific user
  async connectWhatsApp(userId) {
    try {
      // Check if already connected
      if (this.connections.has(userId)) {
        const existingConnection = this.connections.get(userId);
        if (existingConnection && existingConnection.user) {
          return {
            success: true,
            message: 'WhatsApp sudah terhubung',
            number: existingConnection.user.id.split(':')[0]
          };
        }
      }

      const sessionDir = this.getUserSessionDir(userId);
      const logger = this.createUserLogger(userId);
      
      // Use multi-file auth state
      const { state, saveCreds } = await useMultiFileAuthState(sessionDir);
      
      // Create WhatsApp socket
      const socket = makeWASocket({
        auth: state,
        logger,
        printQRInTerminal: false,
        browser: ['Eglobaltech WA-Gateway', 'Chrome', '1.0.0'],
        connectTimeoutMs: 30000,
        defaultQueryTimeoutMs: 30000,
        keepAliveIntervalMs: 30000,
        generateHighQualityLinkPreview: false,
        syncFullHistory: false,
        shouldIgnoreJid: jid => jid.endsWith('@broadcast'),
        getMessage: async (key) => {
          return { conversation: 'Hello World' };
        }
      });

      // Store connection
      this.connections.set(userId, socket);
      
      // Handle connection events
      socket.ev.on('connection.update', async (update) => {
        await this.handleConnectionUpdate(userId, update);
      });

      socket.ev.on('creds.update', saveCreds);

      // Handle messages for contact sync
      socket.ev.on('messages.upsert', async ({ messages, type }) => {
        if (type === 'notify') {
          await this.handleNewMessages(userId, messages);
        }
      });

      // Handle contacts update
      socket.ev.on('contacts.update', async (contacts) => {
        await this.syncContacts(userId, contacts);
      });

      // Handle groups update
      socket.ev.on('groups.update', async (groups) => {
        await this.syncGroups(userId, groups);
      });

      // Set initial status
      await this.updateConnectionStatus(userId, 'connecting');

      return {
        success: true,
        message: 'Proses koneksi WhatsApp dimulai'
      };

    } catch (error) {
      console.error(`Error connecting WhatsApp for user ${userId}:`, error);
      await this.updateConnectionStatus(userId, 'disconnected');
      
      return {
        success: false,
        message: 'Gagal menghubungkan WhatsApp: ' + error.message
      };
    }
  }

  // Handle connection updates
  async handleConnectionUpdate(userId, update) {
    const { connection, lastDisconnect, qr } = update;
    
    try {
      if (qr) {
        // Generate QR code
        const qrCodeData = await QRCode.toDataURL(qr);
        this.qrCodes.set(userId, qrCodeData);
        
        // Update status to scanning
        await this.updateConnectionStatus(userId, 'scanning');
        
        // Store QR code in database
        const dbConnection = await this.getDbConnection();
        await dbConnection.execute(
          'UPDATE user_connections SET qr_code = ? WHERE user_id = ?',
          [qrCodeData, userId]
        );
        await dbConnection.end();
        
        console.log(`QR code generated for user ${userId}`);
      }

      if (connection === 'close') {
        const shouldReconnect = lastDisconnect?.error?.output?.statusCode !== DisconnectReason.loggedOut;
        
        if (shouldReconnect) {
          const attempts = this.reconnectAttempts.get(userId) || 0;
          
          if (attempts < this.maxReconnectAttempts) {
            this.reconnectAttempts.set(userId, attempts + 1);
            console.log(`Reconnecting WhatsApp for user ${userId}, attempt ${attempts + 1}`);
            
            await delay(5000); // Wait 5 seconds before reconnecting
            await this.connectWhatsApp(userId);
          } else {
            console.log(`Max reconnection attempts reached for user ${userId}`);
            await this.updateConnectionStatus(userId, 'disconnected');
            this.connections.delete(userId);
            this.reconnectAttempts.delete(userId);
          }
        } else {
          console.log(`User ${userId} logged out, not reconnecting`);
          await this.updateConnectionStatus(userId, 'disconnected');
          this.connections.delete(userId);
          this.reconnectAttempts.delete(userId);
        }
      }

      if (connection === 'open') {
        const socket = this.connections.get(userId);
        if (socket && socket.user) {
          const whatsappNumber = socket.user.id.split(':')[0];
          const deviceInfo = {
            platform: socket.user.platform,
            device: socket.user.device,
            version: socket.user.version
          };
          
          await this.updateConnectionStatus(userId, 'connected', whatsappNumber, deviceInfo);
          
          // Reset reconnect attempts
          this.reconnectAttempts.delete(userId);
          
          // Clear QR code
          this.qrCodes.delete(userId);
          
          console.log(`WhatsApp connected for user ${userId}, number: ${whatsappNumber}`);
          
          // Sync contacts and groups
          await this.syncUserData(userId);
        }
      }

    } catch (error) {
      console.error(`Error handling connection update for user ${userId}:`, error);
    }
  }

  // Sync user contacts
  async syncContacts(userId, contacts) {
    try {
      const connection = await this.getDbConnection();
      
      for (const contact of contacts) {
        const contactPhone = contact.id.split('@')[0];
        const contactName = contact.name || contact.notify || contactPhone;
        
        await connection.execute(
          `INSERT INTO user_contacts (user_id, contact_name, contact_phone, is_business, updated_at) 
           VALUES (?, ?, ?, ?, NOW()) 
           ON DUPLICATE KEY UPDATE 
           contact_name = VALUES(contact_name), 
           is_business = VALUES(is_business), 
           updated_at = NOW()`,
          [userId, contactName, contactPhone, contact.isBusiness || false]
        );
      }
      
      await connection.end();
      console.log(`Synced ${contacts.length} contacts for user ${userId}`);
      
    } catch (error) {
      console.error(`Error syncing contacts for user ${userId}:`, error);
    }
  }

  // Sync user groups
  async syncGroups(userId, groups) {
    try {
      const connection = await this.getDbConnection();
      
      for (const group of groups) {
        await connection.execute(
          `INSERT INTO user_groups (user_id, group_id, group_name, group_description, participants_count, updated_at) 
           VALUES (?, ?, ?, ?, ?, NOW()) 
           ON DUPLICATE KEY UPDATE 
           group_name = VALUES(group_name), 
           group_description = VALUES(group_description), 
           participants_count = VALUES(participants_count), 
           updated_at = NOW()`,
          [userId, group.id, group.subject, group.desc, group.participants?.length || 0]
        );
      }
      
      await connection.end();
      console.log(`Synced ${groups.length} groups for user ${userId}`);
      
    } catch (error) {
      console.error(`Error syncing groups for user ${userId}:`, error);
    }
  }

  // Sync all user data
  async syncUserData(userId) {
    try {
      const socket = this.connections.get(userId);
      if (!socket) return;

      // Get contacts
      const contacts = await socket.getContacts();
      if (contacts && contacts.length > 0) {
        await this.syncContacts(userId, contacts);
      }

      // Get groups
      const groups = await socket.groupFetchAllParticipating();
      if (groups) {
        const groupArray = Object.values(groups);
        await this.syncGroups(userId, groupArray);
      }

    } catch (error) {
      console.error(`Error syncing user data for user ${userId}:`, error);
    }
  }

  // Handle new messages for contact discovery
  async handleNewMessages(userId, messages) {
    try {
      const newContacts = [];
      
      for (const message of messages) {
        const fromNumber = message.key.remoteJid?.split('@')[0];
        const contactName = message.pushName || fromNumber;
        
        if (fromNumber && !fromNumber.includes('g.us')) {
          newContacts.push({
            id: message.key.remoteJid,
            name: contactName,
            notify: contactName
          });
        }
      }
      
      if (newContacts.length > 0) {
        await this.syncContacts(userId, newContacts);
      }
      
    } catch (error) {
      console.error(`Error handling new messages for user ${userId}:`, error);
    }
  }

  // Send message for specific user
  async sendMessage(userId, number, message) {
    try {
      const socket = this.connections.get(userId);
      
      if (!socket || !socket.user) {
        throw new Error('WhatsApp tidak terhubung');
      }

      // Format number
      let formattedNumber = number;
      if (!number.includes('@')) {
        formattedNumber = `${number.replace(/[^0-9]/g, '')}@c.us`;
      }

      // Send message
      await socket.sendMessage(formattedNumber, { text: message });
      
      return {
        success: true,
        message: 'Pesan berhasil dikirim',
        to: formattedNumber
      };

    } catch (error) {
      console.error(`Error sending message for user ${userId}:`, error);
      throw error;
    }
  }

  // Disconnect WhatsApp for specific user
  async disconnectWhatsApp(userId) {
    try {
      const socket = this.connections.get(userId);
      
      if (socket) {
        await socket.logout();
        this.connections.delete(userId);
        this.qrCodes.delete(userId);
        this.reconnectAttempts.delete(userId);
        
        await this.updateConnectionStatus(userId, 'disconnected');
        
        return {
          success: true,
          message: 'WhatsApp berhasil diputuskan'
        };
      }

      return {
        success: false,
        message: 'WhatsApp tidak terhubung'
      };

    } catch (error) {
      console.error(`Error disconnecting WhatsApp for user ${userId}:`, error);
      return {
        success: false,
        message: 'Gagal memutuskan koneksi: ' + error.message
      };
    }
  }

  // Get connection status
  getConnectionStatus(userId) {
    const socket = this.connections.get(userId);
    const status = this.connectionStatus.get(userId) || 'disconnected';
    const whatsappNumber = socket && socket.user ? socket.user.id.split(':')[0] : null;
    
    return {
      connected: socket && socket.user ? true : false,
      status: status,
      number: whatsappNumber,
      profilePicture: null // TODO: implement profile picture
    };
  }

  // Get QR code (alias for getQRCode)
  getQR(userId) {
    const qrCode = this.qrCodes.get(userId);
    console.log(`Getting QR for user ${userId}:`, qrCode ? 'QR available' : 'No QR');
    return qrCode;
  }

  // Get QR code
  getQRCode(userId) {
    return this.qrCodes.get(userId);
  }

  // Get user connection
  getUserConnection(userId) {
    return this.connections.get(userId);
  }

  // Check if user is connected
  isUserConnected(userId) {
    const socket = this.connections.get(userId);
    return socket && socket.user ? true : false;
  }

  // Get connected WhatsApp number
  getConnectedNumber(userId) {
    const socket = this.connections.get(userId);
    return socket && socket.user ? socket.user.id.split(':')[0] : null;
  }

  // Get groups for specific user
  async getGroups(userId) {
    try {
      const socket = this.connections.get(userId);
      
      if (!socket || !socket.user) {
        throw new Error('WhatsApp tidak terhubung');
      }

      // Get groups from WhatsApp
      const groups = await socket.groupFetchAllParticipating();
      
      // Convert to array format
      const groupArray = Object.values(groups).map(group => ({
        id: group.id,
        name: group.subject,
        description: group.desc,
        participantsCount: group.participants?.length || 0,
        created: group.creation,
        owner: group.owner
      }));

      return groupArray;

    } catch (error) {
      console.error(`Error getting groups for user ${userId}:`, error);
      throw error;
    }
  }

  // Get all connected users
  getConnectedUsers() {
    const connectedUsers = [];
    for (const [userId, socket] of this.connections) {
      if (socket && socket.user) {
        connectedUsers.push({
          userId,
          whatsappNumber: socket.user.id.split(':')[0],
          status: 'connected'
        });
      }
    }
    return connectedUsers;
  }

  // Initialize connections from database
  async initializeConnections() {
    try {
      const connection = await this.getDbConnection();
      
      // Get all users with active connections
      const [users] = await connection.execute(
        `SELECT user_id FROM user_connections 
         WHERE connection_status = 'connected' 
         AND user_id IN (SELECT id FROM users WHERE is_active = 1)`
      );

      await connection.end();

      // Reconnect each user
      for (const user of users) {
        console.log(`Reconnecting WhatsApp for user ${user.user_id}`);
        await this.connectWhatsApp(user.user_id);
      }

    } catch (error) {
      console.error('Error initializing connections:', error);
    }
  }
}

// Create singleton instance
const multiTenantWhatsApp = new MultiTenantWhatsApp();

module.exports = multiTenantWhatsApp; 