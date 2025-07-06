# 🚀 Panduan Update System VPS

Panduan lengkap untuk melakukan update aplikasi WhatsApp SaaS di VPS tanpa harus install ulang.

## 📋 Daftar Isi

1. [Persiapan](#persiapan)
2. [Update via Web Dashboard](#update-via-web-dashboard)
3. [Update via Command Line](#update-via-command-line)
4. [Update Manual](#update-manual)
5. [Rollback System](#rollback-system)
6. [Troubleshooting](#troubleshooting)

## 🔧 Persiapan

### 1. Pastikan Git Terkonfigurasi
```bash
# Cek status git
git status

# Jika ada perubahan local, commit atau stash
git add .
git commit -m "Local changes before update"

# Atau simpan perubahan sementara
git stash
```

### 2. Backup Database (Opsional)
```bash
# Backup database manual
mysqldump -u username -p database_name > backup_$(date +%Y%m%d_%H%M%S).sql
```

## 🌐 Update via Web Dashboard

### 1. Login ke Admin Panel
- Buka browser dan login sebagai admin
- Klik menu **"System Updates"** di admin panel

### 2. Check for Updates
- Klik tombol **"Check for Updates"**
- Sistem akan mengecek apakah ada update terbaru

### 3. Perform Update
- Jika ada update, klik **"Update Now"**
- Sistem akan otomatis:
  - Membuat backup
  - Download update terbaru
  - Restart aplikasi
  - Menampilkan progress real-time

### 4. Verifikasi Update
- Setelah update selesai, halaman akan refresh otomatis
- Cek versi terbaru di dashboard

## 💻 Update via Command Line

### 1. Metode Cepat
```bash
# Update otomatis dengan satu perintah
npm run update-system
```

### 2. Metode Step-by-Step
```bash
# 1. Cek update tersedia
npm run check-updates

# 2. Buat backup dulu
npm run create-backup

# 3. Lakukan update
npm run update-system
```

### 3. Menggunakan Script Langsung
```bash
# Cek status
node utils/updateFromGitHub.js check

# Update aplikasi
node utils/updateFromGitHub.js update

# Buat backup saja
node utils/updateFromGitHub.js backup
```

## 🔄 Update Manual

### 1. Backup Files Penting
```bash
# Buat folder backup
mkdir -p backups/manual_$(date +%Y%m%d_%H%M%S)

# Backup konfigurasi
cp -r config/ backups/manual_$(date +%Y%m%d_%H%M%S)/
cp -r sessions/ backups/manual_$(date +%Y%m%d_%H%M%S)/
cp .env backups/manual_$(date +%Y%m%d_%H%M%S)/
```

### 2. Stop Aplikasi
```bash
# Jika menggunakan PM2
pm2 stop all

# Jika menggunakan screen/tmux
# Tekan Ctrl+C di terminal yang menjalankan aplikasi
```

### 3. Pull Update dari GitHub
```bash
# Fetch perubahan terbaru
git fetch origin

# Pull update
git pull origin main
```

### 4. Update Dependencies
```bash
# Install/update package baru
npm install

# Jika ada error, coba clean install
rm -rf node_modules package-lock.json
npm install
```

### 5. Restart Aplikasi
```bash
# Jika menggunakan PM2
pm2 start ecosystem.config.js

# Atau start manual
npm start
```

## 🔙 Rollback System

### 1. Rollback via Web Dashboard
- Masuk ke admin panel
- Klik **"System Updates"**
- Pilih backup yang ingin di-restore
- Klik **"Rollback"**

### 2. Rollback via Command Line
```bash
# Lihat daftar backup
ls -la backups/

# Rollback ke backup tertentu
npm run rollback backups/backup_2024-01-15T10-30-00-000Z

# Atau menggunakan script langsung
node utils/updateFromGitHub.js rollback backups/backup_2024-01-15T10-30-00-000Z
```

### 3. Rollback Manual
```bash
# Stop aplikasi
pm2 stop all

# Restore dari backup
cp -r backups/manual_20240115_103000/* ./

# Restart aplikasi
pm2 start ecosystem.config.js
```

## 🔧 Troubleshooting

### 1. Error: "Permission denied"
```bash
# Berikan permission yang tepat
chmod +x utils/updateFromGitHub.js
chown -R www-data:www-data /path/to/your/app
```

### 2. Error: "Git not found"
```bash
# Install git
sudo apt update
sudo apt install git

# Atau di CentOS/RHEL
sudo yum install git
```

### 3. Error: "Database connection failed"
```bash
# Test koneksi database
npm run test-db

# Cek service MySQL
sudo systemctl status mysql
sudo systemctl start mysql
```

### 4. Error: "PM2 not found"
```bash
# Install PM2 global
npm install -g pm2

# Atau jalankan tanpa PM2
npm start
```

### 5. Error: "Port already in use"
```bash
# Cari process yang menggunakan port
lsof -i :3000

# Kill process
kill -9 PID_NUMBER

# Atau ganti port di config
nano config/api.js
```

### 6. Update Gagal - Restore Manual
```bash
# Jika update gagal, restore dari backup
cd /path/to/your/app

# Stop aplikasi
pm2 stop all

# Restore dari backup terakhir
cp -r backups/backup_LATEST/* ./

# Restore database jika perlu
mysql -u username -p database_name < backups/database_backup_LATEST.sql

# Restart aplikasi
pm2 start ecosystem.config.js
```

## 🎯 Tips dan Best Practices

### 1. Backup Rutin
```bash
# Buat cron job untuk backup otomatis
crontab -e

# Tambahkan line ini untuk backup setiap hari jam 2 pagi
0 2 * * * cd /path/to/your/app && npm run create-backup
```

### 2. Monitor Update
```bash
# Cek log update
tail -f logs/update.log

# Monitor aplikasi
pm2 monit
```

### 3. Test Setelah Update
```bash
# Test API
curl -X POST http://localhost:3000/api/send-message \
  -H "Content-Type: application/json" \
  -H "X-API-Key: your-api-key" \
  -d '{"to":"628xxxxxxxxx","message":"Test update"}'

# Test database
npm run test-db
```

### 4. Rollback Otomatis
Jika update gagal, sistem akan otomatis mencoba rollback ke versi sebelumnya.

## 🚨 Peringatan Penting

1. **Selalu backup sebelum update**
2. **Test di development environment dulu**
3. **Update saat traffic rendah**
4. **Monitor aplikasi setelah update**
5. **Simpan informasi backup untuk rollback**

## 📞 Support

Jika mengalami masalah:
1. Cek log error di `logs/update.log`
2. Cek status aplikasi dengan `pm2 status`
3. Test koneksi database dengan `npm run test-db`
4. Rollback ke versi sebelumnya jika diperlukan

---

**Update terakhir:** $(date)
**Versi:** 2.0.0 