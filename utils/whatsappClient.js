const {
  default: makeWASocket,
  DisconnectReason,
  useMultiFileAuthState,
  fetchLatestBaileysVersion,
  makeCacheableSignalKeyStore
} = require('@whiskeysockets/baileys');
const MAIN_LOGGER = require('pino');
const path = require('path');
const fs = require('fs');
const { Boom } = require('@hapi/boom');
const Contact = require('../models/Contact');

// Tambahkan import untuk User model
const User = require('../models/User');

// Konfigurasi logger
const logger = MAIN_LOGGER({
  timestamp: () => `,"time":"${new Date().toJSON()}"`,
  level: 'trace'
}).child({ level: 'silent' });

let sock = null;
let qr = null;
let connecting = false;
let connectedNumber = null; // Menyimpan nomor yang terscan
let profilePicture = null; // Menyimpan foto profil
let isConnected = false;
let connectionUpdateHandler = null;
let retryCount = 0;
const MAX_RETRIES = 5;

/**
 * Reset semua state koneksi
 */
function resetState() {
  sock = null;
  qr = null;
  connecting = false;
  connectedNumber = null;
  profilePicture = null;
  isConnected = false;
  retryCount = 0;
}

/**
 * Hapus sesi WhatsApp
 */
async function deleteSession() {
  const sessionsDir = path.join(process.cwd(), 'sessions');
  
  // Pastikan direktori sessions ada
  if (!fs.existsSync(sessionsDir)) {
    fs.mkdirSync(sessionsDir, { recursive: true });
    console.log('Folder sessions dibuat');
    return;
  }

  try {
    // Baca semua file dalam direktori
    const files = fs.readdirSync(sessionsDir);
    
    // Hapus setiap file dalam direktori
    for (const file of files) {
      const filePath = path.join(sessionsDir, file);
      // Pastikan ini adalah file, bukan folder
      if (fs.statSync(filePath).isFile()) {
        fs.unlinkSync(filePath);
        console.log(`File sesi ${file} berhasil dihapus`);
      }
    }
    
    console.log('Semua file sesi WhatsApp berhasil dihapus');
  } catch (error) {
    console.error('Error saat menghapus file sesi:', error);
  }
  
  resetState();
}

/**
 * Logout dari WhatsApp
 */
async function logout() {
  try {
    if (sock) {
      await sock.logout();
      console.log('Berhasil logout dari WhatsApp');
    }
    await deleteSession();
    if (connectionUpdateHandler) {
      connectionUpdateHandler({ 
        closed: true, 
        isConnected: false,
        error: 'Logged out'
      });
    }
  } catch (error) {
    console.error('Error saat logout:', error);
    // Hapus sesi meskipun logout gagal
    await deleteSession();
  }
}

/**
 * Tunggu beberapa detik
 * @param {number} ms Waktu tunggu dalam milidetik
 */
const delay = ms => new Promise(resolve => setTimeout(resolve, ms));

/**
 * Set handler untuk update QR code
 * @param {Function} handler 
 */
function setConnectionUpdateHandler(handler) {
  connectionUpdateHandler = handler;
}

/**
 * Buat koneksi WhatsApp baru
 */
async function connectToWhatsApp() {
  if (connecting) {
    console.log('Koneksi sedang berlangsung...');
    return;
  }

  connecting = true;
  
  try {
    // Pastikan direktori sessions ada
    const sessionsDir = path.join(process.cwd(), 'sessions');
    if (!fs.existsSync(sessionsDir)) {
      fs.mkdirSync(sessionsDir, { recursive: true });
    }

    // Load auth state
    const { state, saveCreds } = await useMultiFileAuthState('sessions');
    const { version } = await fetchLatestBaileysVersion();
    
    // Buat koneksi dengan konfigurasi yang lebih spesifik
    sock = makeWASocket({
      version,
      logger,
      printQRInTerminal: false,
      auth: {
        creds: state.creds,
        keys: makeCacheableSignalKeyStore(state.keys, logger)
      },
      browser: ['Chrome (Windows)', 'Chrome', ''], // Gunakan Chrome untuk kompatibilitas lebih baik
      connectTimeoutMs: 60000, // Tambah timeout untuk koneksi lambat
      qrTimeout: 60000,
      defaultQueryTimeoutMs: 60000,
      emitOwnEvents: true,
      markOnlineOnConnect: true,
      retryRequestDelayMs: 2000,
      fireInitQueries: true,
      generateHighQualityLinkPreview: false,
      syncFullHistory: false,
      patchMessageBeforeSending: (message) => {
        const requiresPatch = !!(
          message.buttonsMessage ||
          message.templateMessage ||
          message.listMessage
        );
        if (requiresPatch) {
          message = {
            viewOnceMessage: {
              message: {
                messageContextInfo: {
                  deviceListMetadataVersion: 2,
                  deviceListMetadata: {},
                },
                ...message,
              },
            },
          };
        }
        return message;
      }
    });

    // Handle koneksi
    sock.ev.on('connection.update', async (update) => {
      const { connection, lastDisconnect, qr: newQr } = update;
      
      console.log('Connection update:', update);

      if (newQr) {
        qr = newQr;
        isConnected = false;
        if (connectionUpdateHandler) {
          connectionUpdateHandler({ qr: newQr, isConnected: false });
        }
        console.log('QR Code baru tersedia');
        retryCount = 0;
      }

      if (connection === 'close') {
        isConnected = false;
        const statusCode = lastDisconnect?.error?.output?.statusCode;
        const shouldReconnect = statusCode !== DisconnectReason.loggedOut;
        
        console.log('Koneksi tertutup karena:', lastDisconnect?.error?.message);
        console.log('Status code:', statusCode);
        
        // Handle specific error codes
        if (statusCode === 515) {
          console.log('Error 515 terdeteksi, mencoba reconnect...');
          if (retryCount < MAX_RETRIES) {
            retryCount++;
            const delayMs = Math.min(1000 * Math.pow(2, retryCount), 30000);
            console.log(`Mencoba koneksi ulang dalam ${delayMs/1000} detik... (Percobaan ${retryCount}/${MAX_RETRIES})`);
            
            await delay(delayMs);
            await connectToWhatsApp();
          } else {
            console.log('Batas maksimum percobaan koneksi tercapai, menghapus sesi...');
            await deleteSession();
            if (connectionUpdateHandler) {
              connectionUpdateHandler({ 
                closed: true, 
                isConnected: false,
                error: 'Koneksi gagal setelah beberapa percobaan. Silakan scan ulang.'
              });
            }
          }
          return;
        }
        
        if (statusCode === DisconnectReason.loggedOut) {
          console.log('User logged out, menghapus sesi...');
          await deleteSession();
          if (connectionUpdateHandler) {
            connectionUpdateHandler({ 
              closed: true, 
              isConnected: false,
              error: 'Logged out'
            });
          }
          return;
        }
        
        if (shouldReconnect && retryCount < MAX_RETRIES) {
          retryCount++;
          const delayMs = Math.min(1000 * Math.pow(2, retryCount), 30000);
          console.log(`Mencoba koneksi ulang dalam ${delayMs/1000} detik... (Percobaan ${retryCount}/${MAX_RETRIES})`);
          
          await delay(delayMs);
            await connectToWhatsApp();
        } else if (retryCount >= MAX_RETRIES) {
          console.log('Batas maksimum percobaan koneksi tercapai.');
          await deleteSession();
          if (connectionUpdateHandler) {
            connectionUpdateHandler({ 
              closed: true, 
              isConnected: false,
              error: 'Batas maksimum percobaan koneksi tercapai'
            });
          }
        }
      } else if (connection === 'open') {
        console.log('WhatsApp terhubung!');
        isConnected = true;
        qr = null;
        retryCount = 0;
        
        // Ambil nomor yang terscan
        if (sock.user && sock.user.id) {
          connectedNumber = sock.user.id.split(':')[0];
          console.log('Nomor WhatsApp yang terhubung:', connectedNumber);
          
          // Generate API key otomatis untuk device ini
          try {
            const deviceId = sock.user.id;
            const deviceName = sock.user.name || 'WhatsApp Device';
            
            // Untuk sementara, kita gunakan user admin (id = 1)
            // Nanti bisa disesuaikan dengan sistem multi-user
            const userId = 1;
            
            const newApiKey = await User.generateDeviceApiKey(userId, deviceId, deviceName);
            console.log(`✅ API Key baru telah dibuat: ${newApiKey}`);
            
            // Update connection handler dengan API key baru
            if (connectionUpdateHandler) {
              connectionUpdateHandler({ 
                connected: true,
                isConnected: true,
                user: sock.user,
                apiKey: newApiKey,
                deviceId: deviceId,
                deviceName: deviceName
              });
            }
          } catch (error) {
            console.error('Error saat generate API key:', error);
          }
          
          // Ambil foto profil
          try {
            const profilePicUrl = await sock.profilePictureUrl(sock.user.id, 'image');
            profilePicture = profilePicUrl;
            console.log('Foto profil berhasil diambil');
            if (connectionUpdateHandler) {
              connectionUpdateHandler({ 
                connected: true,
                isConnected: true,
                profilePicture: profilePicUrl,
                user: sock.user
              });
            }
          } catch (error) {
            console.warn('Tidak bisa mengambil foto profil:', error);
            profilePicture = null;
            if (connectionUpdateHandler) {
              connectionUpdateHandler({ 
                connected: true,
                isConnected: true,
                user: sock.user
              });
            }
          }
        }
        
        // Ambil kontak dan grup setelah terhubung
        try {
          await syncContacts();
          
          // Ambil daftar grup
          const groups = await getGroups();
          console.log(`Terhubung dengan ${groups.length} grup`);
        } catch (error) {
          console.error('Error saat sync kontak/grup:', error);
        }
      }
    });

    // Handle credentials update
    sock.ev.on('creds.update', saveCreds);

    // Handle contacts update
    sock.ev.on('contacts.upsert', async (contacts) => {
      console.log('Kontak baru diterima:', contacts.length);
      try {
        for (const contact of contacts) {
          if (!contact.id || contact.id.includes('g.us')) continue;

          try {
            // Ambil info profil
            const ppUrl = await sock.profilePictureUrl(contact.id).catch(() => null);
            
            // Simpan ke database
            await Contact.upsertContact({
              name: contact.name || contact.verifiedName || '',
              phone: contact.id.split('@')[0],
              whatsapp_id: contact.id,
              profile_picture: ppUrl,
              is_business: !!contact.isBusiness,
              status: contact.status || ''
            });
          } catch (error) {
            console.error(`Error menyimpan kontak ${contact.id}:`, error);
          }
        }
      } catch (error) {
        console.error('Error saat memproses kontak baru:', error);
      }
    });

    // Handle group events
    sock.ev.on('groups.upsert', async (groups) => {
      console.log('Group update received:', groups.length, 'groups');
    });

    sock.ev.on('groups.update', async (updates) => {
      console.log('Group info updates:', updates);
    });

    sock.ev.on('group-participants.update', async (update) => {
      console.log('Group participants update:', update);
    });

  } catch (error) {
    console.error('Error saat koneksi WhatsApp:', error);
    if (retryCount < MAX_RETRIES) {
      retryCount++;
      const delayMs = Math.min(1000 * Math.pow(2, retryCount), 30000);
      console.log(`Mencoba koneksi ulang dalam ${delayMs/1000} detik... (Percobaan ${retryCount}/${MAX_RETRIES})`);
      await delay(delayMs);
      await connectToWhatsApp();
    } else {
      await deleteSession();
      if (connectionUpdateHandler) {
        connectionUpdateHandler({
          closed: true,
          isConnected: false,
          error: 'Gagal membuat koneksi setelah beberapa percobaan'
        });
      }
    }
  } finally {
    connecting = false;
  }
}

/**
 * Sinkronisasi kontak dari WhatsApp ke database
 */
async function syncContacts() {
  try {
    console.log('Database Contact terhubung!');
    
    // Ambil kontak dari event contacts.sync
    sock.ev.on('contacts.set', async ({ contacts }) => {
      console.log(`Ditemukan ${contacts.length} kontak`);

      for (const contact of contacts) {
        if (!contact.id || contact.id.includes('g.us')) continue;

        try {
          // Ambil info profil
          const ppUrl = await sock.profilePictureUrl(contact.id).catch(() => null);
          
          // Simpan ke database
          await Contact.upsertContact({
            name: contact.name || contact.verifiedName || '',
            phone: contact.id.split('@')[0],
            whatsapp_id: contact.id,
            profile_picture: ppUrl,
            is_business: !!contact.isBusiness,
            status: contact.status || ''
          });
        } catch (error) {
          console.error(`Error menyimpan kontak ${contact.id}:`, error);
        }
      }

      console.log('Sinkronisasi kontak selesai');
    });

  } catch (error) {
    console.error('Error saat sinkronisasi kontak:', error);
    throw error;
  }
}

/**
 * Kirim pesan WhatsApp
 * @param {string} to Nomor tujuan (format: 628xxx)
 * @param {string} message Pesan yang akan dikirim
 */
async function sendMessage(to, message) {
  if (!isConnected || !sock) {
    throw new Error('WhatsApp belum terhubung');
  }

  // Format nomor
  const formattedNumber = to.includes('@g.us') ? to : `${to.replace(/[^0-9]/g, '')}@s.whatsapp.net`;

  try {
    await sock.sendMessage(formattedNumber, { text: message });
    return true;
  } catch (error) {
    console.error('Error saat kirim pesan:', error);
    throw error;
  }
}

/**
 * Dapatkan status koneksi
 * @returns {boolean} Status koneksi
 */
function isWhatsAppConnected() {
  return isConnected && sock?.user?.id ? true : false;
}

/**
 * Dapatkan nomor WhatsApp yang terscan
 * @returns {string|null} Nomor WhatsApp yang terhubung
 */
function getConnectedNumber() {
  return connectedNumber;
}

/**
 * Dapatkan foto profil WhatsApp yang terscan
 * @returns {string|null} URL foto profil
 */
function getProfilePicture() {
  return profilePicture;
}

/**
 * Refresh foto profil (jika diperlukan)
 */
async function refreshProfilePicture() {
  if (!sock || !sock.user) {
    return null;
  }

  try {
    const profilePicUrl = await sock.profilePictureUrl(sock.user.id, 'image');
    profilePicture = profilePicUrl;
    return profilePicture;
  } catch (error) {
    console.log('Tidak dapat refresh foto profil:', error.message);
    return null;
  }
}

/**
 * Dapatkan QR code
 * @returns {string|null} QR code dalam format base64
 */
function getQR() {
  return qr;
}

/**
 * Dapatkan daftar grup
 * @returns {Promise<Array>} Daftar grup
 */
async function getGroups() {
  if (!sock) {
    throw new Error('WhatsApp tidak terhubung');
  }

  try {
    console.log('Mengambil daftar grup...');
    
    // Ambil daftar chat
    const chats = await sock.groupFetchAllParticipating();
    console.log('Raw chats data:', chats);
    
    const groups = [];
    
    // Proses setiap grup
    for (const [id, chat] of Object.entries(chats)) {
      try {
        // Pastikan ini adalah grup
        if (!id.endsWith('@g.us')) continue;
        
        // Ambil metadata grup
        const groupMetadata = chat;
        console.log('Group metadata for', id, ':', groupMetadata);
        
        // Ambil info tambahan
        let participantsCount = 0;
        let admins = [];
        
        if (groupMetadata.participants) {
          participantsCount = groupMetadata.participants.length;
          admins = groupMetadata.participants
            .filter(p => p.admin)
            .map(p => p.id);
        }
        
        groups.push({
          id: id,
          subject: groupMetadata.subject || 'Unnamed Group',
          desc: groupMetadata.desc || '',
          participants: participantsCount,
          admins: admins,
          owner: groupMetadata.owner || '',
          creation: groupMetadata.creation || null
        });
      } catch (error) {
        console.error(`Error processing group ${id}:`, error);
      }
    }
    
    console.log('Processed groups:', groups);
    return groups;
  } catch (error) {
    console.error('Error saat ambil daftar grup:', error);
    throw error;
  }
}

/**
 * Dapatkan daftar kontak
 */
async function getContacts() {
  try {
    // Ambil kontak dari database
    const contacts = await Contact.getAllContacts();
    return contacts;
  } catch (error) {
    console.error('Error mengambil kontak:', error);
    throw error;
  }
}

/**
 * Ambil detail kontak berdasarkan WhatsApp ID
 * @param {string} whatsappId WhatsApp ID
 * @returns {Promise<Object|null>} Detail kontak
 */
async function getContactInfo(whatsappId) {
  if (!sock) {
    throw new Error('WhatsApp tidak terhubung');
  }

  try {
    // Ambil info kontak dari store
    const contact = sock.store.contacts[whatsappId];
    
    if (!contact) {
      return null;
    }

    const contactInfo = {
      whatsappId: whatsappId,
      name: contact.name || contact.notify || contact.verifiedName || 'Unknown',
      phone: whatsappId.split('@')[0],
      profilePicture: null,
      isBusiness: contact.isBusiness || false,
      status: contact.status || null
    };

    // Coba ambil foto profil
    try {
      const profilePicUrl = await sock.profilePictureUrl(whatsappId, 'image');
      contactInfo.profilePicture = profilePicUrl;
    } catch (error) {
      contactInfo.profilePicture = null;
    }

    return contactInfo;
  } catch (error) {
    console.error('Error saat ambil info kontak:', error);
    throw error;
  }
}

// Helper function untuk mengecek broadcast JID
function isJidBroadcast(jid) {
  return jid === 'status@broadcast';
}

// Export fungsi-fungsi yang dibutuhkan
module.exports = {
  connectToWhatsApp,
  getClient: () => sock,
  getQR,
  setConnectionUpdateHandler,
  isWhatsAppConnected: () => isConnected,
  getConnectedNumber: () => connectedNumber,
  getProfilePicture: () => profilePicture,
  refreshProfilePicture,
  getGroups,
  getContacts,
  getContactInfo,
  sendMessage,
  logout,
  deleteSession
}; 