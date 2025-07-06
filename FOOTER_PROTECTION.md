# 🛡️ Footer Protection System

## Overview
Sistem proteksi footer yang melindungi hak cipta dan mencegah modifikasi tidak sah pada footer aplikasi.

## ⚠️ PERINGATAN PENTING
**JANGAN MENGUBAH FOOTER TANPA IZIN!**
- Mengubah footer akan menyebabkan aplikasi error
- Aplikasi akan berhenti bekerja jika footer dimodifikasi
- Hubungi developer untuk lisensi: **Eko Adrie - eglobaltech.id**

## 🔒 Fitur Proteksi

### 1. Hash Verification
- Footer diproteksi dengan SHA-256 hash
- Hash diperiksa setiap kali aplikasi dimulai
- Hash diperiksa pada setiap HTTP request

### 2. Automatic Error Response
Jika footer diubah, aplikasi akan:
- Menampilkan error 500 pada semua request
- Menampilkan pesan error dengan kontak developer
- Mencatat security alert di console
- Menghentikan aplikasi saat startup

### 3. Real-time Monitoring
- Middleware memeriksa integritas footer pada setiap request
- Tidak ada delay atau impact performa
- Immediate response jika terdeteksi modifikasi

## 📝 Footer Yang Dilindungi
```
© Eko Adrie - eglobaltech.id 2025
```

## 🚨 Error Response
Jika footer dimodifikasi, response akan berupa:
```json
{
  "success": false,
  "message": "SECURITY ERROR: Aplikasi telah dimodifikasi tanpa izin",
  "error": "Footer integrity check failed",
  "contact": "Eko Adrie - eglobaltech.id"
}
```

## 🔧 Technical Details

### Files Protected:
- `views/partials/footer.ejs`

### Protection Components:
- `utils/footerProtection.js` - Core protection logic
- Hash: `eed373804fde7ea7ecf16e1078b7fd1d9be6147b915cece6fdac6d298ca72c56`
- Security Key: `EGLOBALTECH_SECURITY_KEY`

### Integration Points:
- Server startup check in `server.js`
- Middleware protection on all routes
- Automatic application termination on violation

## 📞 Support & Licensing
Untuk pertanyaan lisensi atau modifikasi yang sah:
**Eko Adrie - eglobaltech.id**

---
**© 2025 Eko Adrie - eglobaltech.id. All rights reserved.** 