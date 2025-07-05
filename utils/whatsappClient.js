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
        }
      } else if (connection === 'open') {
        console.log('WhatsApp terhubung!');
        qr = null;
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
  getQR,
  getGroups,
  getClient: () => sock
}; 