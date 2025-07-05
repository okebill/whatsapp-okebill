const makeWASocket = require('@whiskeysockets/baileys').default;
const { DisconnectReason, useMultiFileAuthState } = require('@whiskeysockets/baileys');
const pino = require('pino');
const path = require('path');
const fs = require('fs');

let sock = null;
let qrCode = null;
let isConnected = false;
let groupList = [];

// Memastikan folder sessions ada
const sessionsDir = path.join(process.cwd(), 'sessions');
if (!fs.existsSync(sessionsDir)) {
  fs.mkdirSync(sessionsDir, { recursive: true });
}

async function connectToWhatsApp() {
  const { state, saveCreds } = await useMultiFileAuthState('sessions');
  
  // Membuat koneksi WhatsApp baru
  sock = makeWASocket({
    printQRInTerminal: true,
    auth: state,
    logger: pino({ level: 'silent' }),
  });

  // Meng-handle koneksi
  sock.ev.on('connection.update', async (update) => {
    const { connection, lastDisconnect, qr } = update;

    if (qr) {
      // Update QR code ketika tersedia
      qrCode = qr;
      isConnected = false;
    }

    if (connection === 'close') {
      const shouldReconnect = (lastDisconnect.error?.output?.statusCode !== DisconnectReason.loggedOut);
      
      if (shouldReconnect) {
        connectToWhatsApp();
      }
      
      isConnected = false;
    } else if (connection === 'open') {
      isConnected = true;
      qrCode = null;
      
      // Mendapatkan daftar grup
      try {
        const response = await sock.groupFetchAllParticipating();
        groupList = Object.entries(response).map(([id, info]) => ({
          id,
          subject: info.subject,
          participants: info.participants.length
        }));
      } catch (err) {
        console.error('Error fetching groups:', err);
        groupList = [];
      }
    }
  });

  // Simpan credentials saat ada perubahan
  sock.ev.on('creds.update', saveCreds);

  return sock;
}

function getClient() {
  return sock;
}

function getQR() {
  return qrCode;
}

function getConnectionStatus() {
  return isConnected;
}

function getGroups() {
  return groupList;
}

module.exports = {
  connectToWhatsApp,
  getClient,
  getQR,
  getConnectionStatus,
  getGroups
}; 