const express = require('express');
const router = express.Router();
const { requireAuth, requireValidSubscription } = require('../middleware/auth');
const { isWhatsAppConnected, getContacts, getContactInfo } = require('../utils/whatsappClient');
const Contact = require('../models/Contact');

// Middleware autentikasi untuk semua route
router.use(requireAuth);
router.use(requireValidSubscription);

// Halaman utama kontak
router.get('/', async (req, res) => {
  try {
    const whatsappStatus = isWhatsAppConnected();
    let contacts = [];
    let contactCount = 0;
    let error = null;

    try {
      contacts = await Contact.getAllContacts();
      contactCount = await Contact.getContactCount();
    } catch (dbError) {
      console.error('Error loading contacts from database:', dbError);
      error = 'Gagal memuat kontak dari database';
    }

    res.render('contacts', {
      user: req.session.user,
      contacts,
      contactCount,
      whatsappStatus,
      error
    });
  } catch (error) {
    console.error('Error loading contacts page:', error);
    res.status(500).render('error', {
      error: 'Terjadi kesalahan saat memuat halaman kontak',
      message: error.message
    });
  }
});

// Sync kontak dari WhatsApp
router.post('/sync', async (req, res) => {
  try {
    if (!isWhatsAppConnected()) {
      return res.json({
        success: false,
        message: 'WhatsApp belum terhubung'
      });
    }

    // Ambil kontak dari WhatsApp
    const whatsappContacts = await getContacts();
    
    let syncedCount = 0;
    let updatedCount = 0;
    let errorCount = 0;

    // Proses setiap kontak
    for (const contact of whatsappContacts) {
      try {
        const existingContact = await Contact.getByWhatsappId(contact.whatsappId);
        
        if (existingContact) {
          // Update kontak yang sudah ada
          await Contact.updateContact(contact.whatsappId, {
            name: contact.name,
            phone: contact.phone,
            profilePicture: contact.profilePicture,
            isBusiness: contact.isBusiness,
            status: contact.status
          });
          updatedCount++;
        } else {
          // Tambah kontak baru
          await Contact.createContact({
            name: contact.name,
            phone: contact.phone,
            whatsappId: contact.whatsappId,
            profilePicture: contact.profilePicture,
            isBusiness: contact.isBusiness,
            status: contact.status
          });
          syncedCount++;
        }
      } catch (contactError) {
        console.error('Error processing contact:', contact.whatsappId, contactError);
        errorCount++;
      }
    }

    res.json({
      success: true,
      message: `Sinkronisasi selesai: ${syncedCount} kontak baru, ${updatedCount} kontak diperbarui`,
      stats: {
        total: whatsappContacts.length,
        synced: syncedCount,
        updated: updatedCount,
        errors: errorCount
      }
    });

  } catch (error) {
    console.error('Error syncing contacts:', error);
    res.status(500).json({
      success: false,
      message: 'Gagal sinkronisasi kontak: ' + error.message
    });
  }
});

// Update kontak tertentu
router.post('/update/:whatsappId', async (req, res) => {
  try {
    const { whatsappId } = req.params;
    const decodedId = decodeURIComponent(whatsappId);

    if (!isWhatsAppConnected()) {
      return res.json({
        success: false,
        message: 'WhatsApp belum terhubung'
      });
    }

    // Ambil info terbaru dari WhatsApp
    const contactInfo = await getContactInfo(decodedId);
    
    if (!contactInfo) {
      return res.json({
        success: false,
        message: 'Kontak tidak ditemukan di WhatsApp'
      });
    }

    // Update di database
    const updated = await Contact.updateContact(decodedId, {
      name: contactInfo.name,
      phone: contactInfo.phone,
      profilePicture: contactInfo.profilePicture,
      isBusiness: contactInfo.isBusiness,
      status: contactInfo.status
    });

    if (updated) {
      res.json({
        success: true,
        message: 'Kontak berhasil diperbarui',
        contact: contactInfo
      });
    } else {
      res.json({
        success: false,
        message: 'Kontak tidak ditemukan di database'
      });
    }

  } catch (error) {
    console.error('Error updating contact:', error);
    res.json({
      success: false,
      message: 'Gagal memperbarui kontak: ' + error.message
    });
  }
});

// Hapus kontak
router.delete('/delete/:whatsappId', async (req, res) => {
  try {
    const { whatsappId } = req.params;
    const decodedId = decodeURIComponent(whatsappId);

    const deleted = await Contact.deleteContact(decodedId);

    if (deleted) {
      res.json({
        success: true,
        message: 'Kontak berhasil dihapus'
      });
    } else {
      res.json({
        success: false,
        message: 'Kontak tidak ditemukan'
      });
    }

  } catch (error) {
    console.error('Error deleting contact:', error);
    res.json({
      success: false,
      message: 'Gagal menghapus kontak: ' + error.message
    });
  }
});

// Pencarian kontak
router.get('/search', async (req, res) => {
  try {
    const { q } = req.query;
    
    if (!q || q.trim() === '') {
      return res.json({
        success: false,
        message: 'Query pencarian tidak boleh kosong'
      });
    }

    const contacts = await Contact.searchContacts(q.trim());
    
    res.json({
      success: true,
      contacts: contacts,
      count: contacts.length
    });

  } catch (error) {
    console.error('Error searching contacts:', error);
    res.json({
      success: false,
      message: 'Gagal mencari kontak: ' + error.message
    });
  }
});

// Hapus semua kontak
router.delete('/clear', async (req, res) => {
  try {
    await Contact.deleteAllContacts();
    
    res.json({
      success: true,
      message: 'Semua kontak berhasil dihapus'
    });

  } catch (error) {
    console.error('Error clearing contacts:', error);
    res.json({
      success: false,
      message: 'Gagal menghapus semua kontak: ' + error.message
    });
  }
});

module.exports = router; 