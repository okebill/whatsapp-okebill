const {
  default: makeWASocket,
  DisconnectReason,
  useMultiFileAuthState,
  fetchLatestBaileysVersion
} = require('@whiskeysockets/baileys');
const pino = require('pino');
const path = require('path');
const fs = require('fs');

let sock = null;
let qr = null;
let connecting = false;
let connectedNumber = null; // Menyimpan nomor yang terscan
let profilePicture = null; // Menyimpan foto profil

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

    // Buat koneksi
    sock = makeWASocket({
      version,
      printQRInTerminal: true,
      auth: state,
      logger: pino({ level: 'silent' })
    });

    // Handle koneksi
    sock.ev.on('connection.update', async (update) => {
      const { connection, lastDisconnect, qr: newQr } = update;

      if (newQr) {
        qr = newQr;
        console.log('QR Code baru tersedia');
      }

      if (connection === 'close') {
        const shouldReconnect = lastDisconnect?.error?.output?.statusCode !== DisconnectReason.loggedOut;
        console.log('Koneksi tertutup karena', lastDisconnect?.error?.output?.payload?.message);
        
        if (shouldReconnect) {
          console.log('Mencoba koneksi ulang...');
          connectToWhatsApp();
        } else {
          // Reset data saat logout
          connectedNumber = null;
          profilePicture = null;
        }
      } else if (connection === 'open') {
        console.log('WhatsApp terhubung!');
        qr = null;
        
        // Ambil nomor yang terscan
        if (sock.user && sock.user.id) {
          connectedNumber = sock.user.id.split(':')[0]; // Format: "6281234567890:xx@s.whatsapp.net"
          console.log('Nomor WhatsApp yang terhubung:', connectedNumber);
          
          // Ambil foto profil
          try {
            const profilePicUrl = await sock.profilePictureUrl(sock.user.id, 'image');
            profilePicture = profilePicUrl;
            console.log('Foto profil berhasil diambil');
          } catch (error) {
            console.log('Tidak dapat mengambil foto profil:', error.message);
            profilePicture = null;
          }
        }
      }
    });

    // Handle credentials update
    sock.ev.on('creds.update', saveCreds);

  } catch (error) {
    console.error('Error saat koneksi WhatsApp:', error);
  } finally {
    connecting = false;
  }
}

/**
 * Kirim pesan WhatsApp
 * @param {string} to Nomor tujuan (format: 628xxx)
 * @param {string} message Pesan yang akan dikirim
 */
async function sendMessage(to, message) {
  if (!sock) {
    throw new Error('WhatsApp tidak terhubung');
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
function getConnectionStatus() {
  return sock?.user?.id ? true : false;
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
    const groups = await sock.groupFetchAllParticipating();
    return Object.entries(groups).map(([id, group]) => ({
      id,
      subject: group.subject,
      participants: group.participants.length
    }));
  } catch (error) {
    console.error('Error saat ambil daftar grup:', error);
    throw error;
  }
}

// Export fungsi-fungsi yang dibutuhkan
module.exports = {
  connectToWhatsApp,
  sendMessage,
  getConnectionStatus,
  getConnectedNumber,
  getProfilePicture,
  refreshProfilePicture,
  getQR,
  getGroups,
  getClient: () => sock
}; 