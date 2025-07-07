# 🚀 Eglobaltech WA-Gateway

**Sistem WhatsApp Gateway Multi-Tenant dengan Dashboard Admin dan API REST**

[![Node.js](https://img.shields.io/badge/Node.js-v14+-green.svg)](https://nodejs.org/)
[![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue.svg)](https://mysql.com/)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen.svg)]()

## 📋 Daftar Isi

1. [Overview](#overview)
2. [Fitur Utama](#fitur-utama)
3. [Persyaratan Sistem](#persyaratan-sistem)
4. [Instalasi](#instalasi)
5. [Konfigurasi](#konfigurasi)
6. [Penggunaan](#penggunaan)
7. [API Documentation](#api-documentation)
8. [Fitur Keamanan](#fitur-keamanan)
9. [Troubleshooting](#troubleshooting)
10. [Maintenance](#maintenance)
11. [Upgrade Guide](#upgrade-guide)
12. [Lisensi](#lisensi)

---

## 📖 Overview

Eglobaltech WA-Gateway adalah sistem WhatsApp Gateway yang powerful dan scalable, dirancang untuk memungkinkan integrasi WhatsApp dengan layanan eksternal melalui REST API. Aplikasi ini mendukung multi-tenant, sistem billing, dan dashboard admin yang lengkap.

### 🎯 Tujuan Utama
- Menyediakan API Gateway yang stabil untuk WhatsApp
- Sistem multi-tenant dengan billing otomatis
- Dashboard admin yang user-friendly
- Keamanan tingkat enterprise
- Scalability untuk bisnis besar

---

## ✨ Fitur Utama

### 🔐 Sistem Autentikasi & Keamanan
- **Multi-tenant Authentication**: Sistem login terpisah untuk setiap user
- **Role-based Access Control**: Admin dan User dengan hak akses berbeda
- **Password Security**: Validasi kekuatan password dan fitur ubah password
- **API Key Management**: Generate dan manage API key unik per user
- **Session Management**: Sistem sesi yang aman dengan timeout otomatis

### 📱 WhatsApp Integration
- **Multi-device Support**: Mendukung multiple WhatsApp device per user
- **QR Code Scanner**: Interface untuk scan QR code WhatsApp Web
- **Message Handling**: Kirim pesan teks, media, dan dokumen
- **Group Management**: Kelola grup WhatsApp
- **Contact Management**: Sinkronisasi dan kelola kontak
- **Auto-reconnect**: Otomatis reconnect saat koneksi terputus

### 🏢 Multi-tenant & Billing
- **User Registration**: Sistem pendaftaran user dengan approval workflow
- **Subscription Management**: Sistem langganan bulanan/tahunan
- **Payment Status Tracking**: Monitor status pembayaran user
- **Trial Period**: Masa trial otomatis untuk user baru
- **Usage Limits**: Batasi penggunaan API berdasarkan paket

### 📊 Dashboard & Monitoring
- **Admin Dashboard**: Overview sistem, user management, statistik
- **User Dashboard**: Interface user untuk kelola WhatsApp dan API
- **API Usage Statistics**: Monitor penggunaan API real-time
- **System Health**: Monitor status sistem dan koneksi
- **Activity Logs**: Log semua aktivitas user dan sistem

### 🔧 Advanced Features
- **PPP Generator**: Generate konfigurasi Mikrotik untuk integrasi
- **API Documentation**: Dokumentasi API interaktif
- **Backup & Restore**: Sistem backup otomatis
- **Update System**: Update aplikasi tanpa downtime
- **Footer Protection**: Sistem proteksi branding dengan hash

---

## 🖥️ Persyaratan Sistem

### Software Requirements
- **Node.js**: v14.0 atau lebih baru
- **MySQL/MariaDB**: v8.0 atau lebih baru
- **Web Server**: Nginx/Apache (untuk production)
- **Process Manager**: PM2 (untuk production)
- **Git**: Untuk deployment dan update

### Hardware Requirements

#### Development
- **RAM**: 2GB minimum
- **CPU**: 2 Core
- **Storage**: 5GB
- **Network**: Broadband internet

#### Production
- **RAM**: 4GB minimum (8GB recommended)
- **CPU**: 4 Core (8 Core recommended)
- **Storage**: 20GB SSD
- **Network**: Dedicated server dengan IP static

### Supported Platforms
- **Linux**: Ubuntu 18.04+, CentOS 7+, Debian 9+
- **Windows**: Windows 10, Windows Server 2016+
- **macOS**: macOS 10.14+

---

## 🚀 Instalasi

### A. Instalasi Development (Local)

#### 1. Persiapan Environment
```bash
# Clone repository
git clone https://github.com/your-repo/wabot-api.git
cd wabot-api

# Install dependencies
npm install

# Copy environment file
cp .env.example .env
```

#### 2. Setup Database
```bash
# Buat database MySQL
mysql -u root -p
CREATE DATABASE wabot_db;
USE wabot_db;
SOURCE database/schema.sql;
EXIT;
```

#### 3. Konfigurasi Environment
Edit file `.env`:
```env
# Server Configuration
PORT=1992
NODE_ENV=development
SESSION_SECRET=your_session_secret_here

# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_password
DB_NAME=wabot_db
DB_PORT=3306

# API Configuration
API_KEY_LENGTH=32
DEFAULT_TRIAL_DAYS=7

# WhatsApp Configuration
WHATSAPP_SESSION_TIMEOUT=300000
```

#### 4. Generate API Key & Create Admin
```bash
# Generate API key untuk sistem
npm run generate-api-key

# Create default admin user
npm run create-admin
```

#### 5. Jalankan Aplikasi
```bash
# Development mode
npm run dev

# Production mode
npm start
```

### B. Instalasi Production (VPS/aaPanel)

#### 1. Persiapan Server
```bash
# Update system
sudo apt update && sudo apt upgrade -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2
sudo npm install -g pm2

# Install MySQL
sudo apt install mysql-server -y
sudo mysql_secure_installation
```

#### 2. Setup Database
```bash
# Login ke MySQL
sudo mysql -u root -p

# Create database dan user
CREATE DATABASE wabot_db;
CREATE USER 'wabot_user'@'localhost' IDENTIFIED BY 'strong_password';
GRANT ALL PRIVILEGES ON wabot_db.* TO 'wabot_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

#### 3. Deploy Application
```bash
# Clone repository
cd /var/www/
sudo git clone https://github.com/your-repo/wabot-api.git
cd wabot-api

# Install dependencies
sudo npm install --production

# Set permissions
sudo chown -R www-data:www-data /var/www/wabot-api
sudo chmod -R 755 /var/www/wabot-api
sudo chmod -R 777 /var/www/wabot-api/sessions
```

#### 4. Konfigurasi Production
```bash
# Copy dan edit environment
sudo cp .env.example .env
sudo nano .env
```

Environment production:
```env
# Server Configuration
PORT=1992
NODE_ENV=production
SESSION_SECRET=super_secure_session_secret_here

# Database Configuration
DB_HOST=localhost
DB_USER=wabot_user
DB_PASSWORD=strong_password
DB_NAME=wabot_db
DB_PORT=3306

# Security
API_KEY_LENGTH=32
SESSION_TIMEOUT=1800000
RATE_LIMIT_MAX=100
RATE_LIMIT_WINDOW=900000

# Email Configuration (optional)
EMAIL_HOST=smtp.gmail.com
EMAIL_PORT=587
EMAIL_USER=your-email@gmail.com
EMAIL_PASS=your-app-password
```

#### 5. Setup PM2
```bash
# Import database schema
mysql -u wabot_user -p wabot_db < database/schema.sql

# Generate API key dan create admin
npm run generate-api-key
npm run create-admin

# Start dengan PM2
pm2 start ecosystem.config.js
pm2 save
pm2 startup
```

#### 6. Setup Nginx Reverse Proxy
```nginx
# /etc/nginx/sites-available/wabot-api
server {
    listen 80;
    server_name your-domain.com;
    
    location / {
        proxy_pass http://127.0.0.1:1992;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_cache_bypass $http_upgrade;
    }
}
```

```bash
# Enable site
sudo ln -s /etc/nginx/sites-available/wabot-api /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

---

## ⚙️ Konfigurasi

### Database Configuration

#### MySQL Optimization
```sql
-- Optimize MySQL for WhatsApp Gateway
SET GLOBAL innodb_buffer_pool_size = 1G;
SET GLOBAL max_connections = 200;
SET GLOBAL query_cache_size = 64M;
SET GLOBAL query_cache_limit = 2M;
```

#### Database Schema
```sql
-- Users table dengan multi-tenant support
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(20),
    full_name VARCHAR(100),
    role ENUM('admin', 'user') DEFAULT 'user',
    is_active BOOLEAN DEFAULT FALSE,
    api_key VARCHAR(255) UNIQUE,
    payment_status ENUM('trial', 'active', 'suspended', 'expired') DEFAULT 'trial',
    subscription_type ENUM('monthly', 'yearly') DEFAULT 'monthly',
    trial_ends_at DATETIME,
    expired_date DATE,
    last_payment_date DATETIME,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Settings table untuk konfigurasi sistem
CREATE TABLE settings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    setting_key VARCHAR(100) UNIQUE NOT NULL,
    setting_value TEXT,
    description TEXT,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Message stats untuk monitoring
CREATE TABLE message_stats (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    message_type ENUM('text', 'media', 'document') DEFAULT 'text',
    status ENUM('sent', 'failed', 'pending') DEFAULT 'pending',
    recipient VARCHAR(20) NOT NULL,
    message_content TEXT,
    sent_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Contacts table
CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    is_group BOOLEAN DEFAULT FALSE,
    group_id VARCHAR(100),
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);
```

### Security Configuration

#### API Key Management
```javascript
// Generate secure API key
const crypto = require('crypto');

function generateApiKey(length = 32) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < length; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
}
```

#### Password Security
```javascript
// Password hashing dengan bcrypt
const bcrypt = require('bcryptjs');

async function hashPassword(password) {
    const saltRounds = 12;
    return await bcrypt.hash(password, saltRounds);
}

async function validatePassword(password, hash) {
    return await bcrypt.compare(password, hash);
}
```

---

## 🎯 Penggunaan

### Admin Dashboard

#### Login Admin
```
URL: http://your-domain.com/auth/login
Username: admin
Password: (password yang di-generate saat instalasi)
```

#### Fitur Admin
1. **User Management**
   - Approve/reject user registration
   - Suspend/activate user accounts
   - Update user subscriptions
   - View user statistics

2. **System Settings**
   - Configure system parameters
   - Enable/disable registration
   - Set auto-approval settings
   - Update system information

3. **API Usage Monitoring**
   - Real-time API usage statistics
   - User activity logs
   - System performance metrics
   - Error tracking

### User Dashboard

#### Registrasi User
```
URL: http://your-domain.com/auth/register
```

#### Fitur User
1. **WhatsApp Management**
   - Scan QR code untuk connect
   - View connection status
   - Manage contacts dan groups
   - Send test messages

2. **API Integration**
   - View API documentation
   - Get API key
   - Generate PPP configurations
   - Monitor API usage

3. **Account Management**
   - Change password
   - View subscription status
   - Update profile information
   - View billing history

---

## 📡 API Documentation

### Authentication

#### API Key Authentication
```javascript
// Header yang diperlukan
{
    "api-key": "your-api-key-here",
    "Content-Type": "application/json"
}
```

### Endpoints

#### 1. Send Message
```javascript
POST /api/send-message
Headers: {
    "api-key": "your-api-key"
}
Body: {
    "number": "628123456789",
    "message": "Hello from WA-Gateway!"
}

Response: {
    "success": true,
    "message": "Message sent successfully",
    "messageId": "msg_123456789"
}
```

#### 2. Send Media
```javascript
POST /api/send-media
Headers: {
    "api-key": "your-api-key"
}
Body: {
    "number": "628123456789",
    "media": "https://example.com/image.jpg",
    "caption": "Image caption"
}

Response: {
    "success": true,
    "message": "Media sent successfully",
    "messageId": "msg_123456790"
}
```

#### 3. Get Status
```javascript
GET /api/status
Headers: {
    "api-key": "your-api-key"
}

Response: {
    "success": true,
    "status": "connected",
    "device": "Device Name",
    "battery": 85,
    "lastSeen": "2024-01-15T10:30:00Z"
}
```

#### 4. Get Contacts
```javascript
GET /api/contacts
Headers: {
    "api-key": "your-api-key"
}

Response: {
    "success": true,
    "contacts": [
        {
            "id": "628123456789@c.us",
            "name": "John Doe",
            "number": "628123456789",
            "isGroup": false
        }
    ]
}
```

#### 5. Get Groups
```javascript
GET /api/groups
Headers: {
    "api-key": "your-api-key"
}

Response: {
    "success": true,
    "groups": [
        {
            "id": "group123@g.us",
            "name": "My Group",
            "participants": 25,
            "description": "Group description"
        }
    ]
}
```

### Error Handling

#### Common Error Responses
```javascript
// Invalid API Key
{
    "success": false,
    "error": "Invalid API key",
    "code": 401
}

// Rate Limit Exceeded
{
    "success": false,
    "error": "Rate limit exceeded",
    "code": 429,
    "retryAfter": 60
}

// WhatsApp Not Connected
{
    "success": false,
    "error": "WhatsApp not connected",
    "code": 503
}
```

---

## 🔐 Fitur Keamanan

### Password Management

#### Fitur Ubah Password
- **Access**: User dropdown → "Ubah Password"
- **URL**: `/auth/change-password`
- **Features**:
  - Password strength indicator real-time
  - Toggle show/hide password
  - Validasi password lama
  - Konfirmasi password baru
  - Security tips dan best practices

#### Security Validations
- Password minimal 6 karakter
- Kombinasi huruf, angka, dan simbol
- Password baru harus berbeda dari lama
- Logging aktivitas ubah password

### API Security

#### Rate Limiting
```javascript
// Konfigurasi rate limiting
const rateLimit = {
    windowMs: 15 * 60 * 1000, // 15 menit
    max: 100, // maksimal 100 request per window
    message: "Too many requests, please try again later"
};
```

#### Input Validation
```javascript
// Validasi input untuk mencegah injection
const validator = require('validator');

function validatePhoneNumber(phone) {
    return validator.isMobilePhone(phone, 'id-ID');
}

function sanitizeMessage(message) {
    return validator.escape(message);
}
```

### Footer Protection

#### Hash-based Protection
```javascript
// Sistem proteksi footer dengan SHA-256
const crypto = require('crypto');

const PROTECTED_FOOTER = "© Eko Adrie - eglobaltech.id 2025";
const FOOTER_HASH = "eed373804fde7ea7ecf16e1078b7fd1d9be6147b915cece6fdac6d298ca72c56";

function validateFooter(footerContent) {
    const hash = crypto.createHash('sha256').update(footerContent).digest('hex');
    return hash === FOOTER_HASH;
}
```

---

## 🛠️ Troubleshooting

### Common Issues

#### 1. Database Connection Error
```bash
# Symptoms
Error: connect ECONNREFUSED 127.0.0.1:3306

# Solutions
1. Check MySQL service status
sudo systemctl status mysql

2. Verify database credentials in .env
DB_HOST=localhost
DB_USER=correct_username
DB_PASSWORD=correct_password

3. Test database connection
mysql -u username -p -h localhost
```

#### 2. WhatsApp Connection Issues
```bash
# Symptoms
WhatsApp not connected, QR code not loading

# Solutions
1. Clear sessions folder
rm -rf sessions/*

2. Check folder permissions
chmod 777 sessions/

3. Restart application
pm2 restart wabot-api

4. Check firewall settings
sudo ufw status
```

#### 3. API Key Issues
```bash
# Symptoms
Invalid API key error

# Solutions
1. Regenerate API key
npm run generate-api-key

2. Check API key in database
SELECT api_key FROM users WHERE username = 'your_username';

3. Verify header format
Headers: {
    "api-key": "your-api-key-here"
}
```

#### 4. Port Already in Use
```bash
# Symptoms
Error: listen EADDRINUSE :::1992

# Solutions
1. Check what's using the port
netstat -tlnp | grep :1992
lsof -i :1992

2. Kill the process
kill -9 PID

3. Change port in .env
PORT=1993
```

#### 5. Permission Denied
```bash
# Symptoms
EACCES: permission denied

# Solutions
1. Fix file ownership
sudo chown -R www-data:www-data /var/www/wabot-api

2. Set correct permissions
chmod -R 755 /var/www/wabot-api
chmod -R 777 /var/www/wabot-api/sessions

3. Check user permissions
ls -la /var/www/wabot-api
```

### Performance Issues

#### High Memory Usage
```bash
# Check memory usage
free -h
pm2 monit

# Solutions
1. Restart PM2 processes
pm2 restart all

2. Optimize MySQL
mysql -u root -p
SET GLOBAL innodb_buffer_pool_size = 512M;

3. Clear logs
pm2 flush
```

#### Slow API Response
```bash
# Check API response time
curl -w "@curl-format.txt" -o /dev/null -s "http://localhost:1992/api/status"

# Solutions
1. Check database queries
SHOW PROCESSLIST;

2. Optimize database indexes
CREATE INDEX idx_user_id ON message_stats(user_id);

3. Enable query caching
SET GLOBAL query_cache_size = 64M;
```

---

## 🔄 Maintenance

### Regular Maintenance Tasks

#### 1. Database Maintenance
```bash
# Weekly database optimization
mysql -u root -p wabot_db -e "OPTIMIZE TABLE users, message_stats, contacts;"

# Clean old logs
mysql -u root -p wabot_db -e "DELETE FROM message_stats WHERE sent_date < DATE_SUB(NOW(), INTERVAL 30 DAY);"

# Backup database
mysqldump -u root -p wabot_db > backup_$(date +%Y%m%d).sql
```

#### 2. File System Maintenance
```bash
# Clean temporary files
find /var/www/wabot-api/sessions -type f -mtime +7 -delete

# Rotate logs
pm2 flush
logrotate /etc/logrotate.d/pm2

# Check disk space
df -h
```

#### 3. Security Updates
```bash
# Update system packages
sudo apt update && sudo apt upgrade -y

# Update Node.js dependencies
npm audit
npm update

# Check for security vulnerabilities
npm audit fix
```

### Backup Strategy

#### 1. Automated Backup Script
```bash
#!/bin/bash
# /usr/local/bin/backup-wabot.sh

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/var/backups/wabot-api"
APP_DIR="/var/www/wabot-api"

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup database
mysqldump -u root -p$DB_PASSWORD wabot_db > $BACKUP_DIR/database_$DATE.sql

# Backup application files
tar -czf $BACKUP_DIR/app_$DATE.tar.gz -C $APP_DIR .

# Backup sessions
tar -czf $BACKUP_DIR/sessions_$DATE.tar.gz -C $APP_DIR/sessions .

# Clean old backups (keep 7 days)
find $BACKUP_DIR -type f -mtime +7 -delete

echo "Backup completed: $DATE"
```

#### 2. Setup Cron Job
```bash
# Add to crontab
crontab -e

# Daily backup at 2 AM
0 2 * * * /usr/local/bin/backup-wabot.sh >> /var/log/backup-wabot.log 2>&1
```

### Monitoring

#### 1. System Monitoring
```bash
# Check system resources
htop
iotop
netstat -tlnp

# Check application status
pm2 status
pm2 logs wabot-api --lines 50
```

#### 2. Database Monitoring
```sql
-- Check database performance
SHOW PROCESSLIST;
SHOW STATUS LIKE 'Threads_connected';
SHOW STATUS LIKE 'Questions';
SHOW STATUS LIKE 'Uptime';

-- Check table sizes
SELECT 
    table_name,
    ROUND(((data_length + index_length) / 1024 / 1024), 2) AS 'Size in MB'
FROM information_schema.tables 
WHERE table_schema = 'wabot_db';
```

---

## 📈 Upgrade Guide

### Version Upgrade Process

#### 1. Pre-upgrade Checklist
```bash
# Backup current installation
/usr/local/bin/backup-wabot.sh

# Check current version
cat package.json | grep version

# Stop application
pm2 stop wabot-api
```

#### 2. Upgrade Application
```bash
# Pull latest changes
cd /var/www/wabot-api
git stash
git pull origin main
git stash pop

# Update dependencies
npm install

# Run database migrations (if any)
npm run migrate
```

#### 3. Post-upgrade Tasks
```bash
# Restart application
pm2 start wabot-api

# Verify installation
curl -I http://localhost:1992

# Check logs
pm2 logs wabot-api --lines 20
```

### Database Migration

#### Migration Script Example
```javascript
// migrations/001_add_subscription_fields.js
const mysql = require('mysql2/promise');

async function up(connection) {
    await connection.execute(`
        ALTER TABLE users 
        ADD COLUMN subscription_type ENUM('monthly', 'yearly') DEFAULT 'monthly',
        ADD COLUMN trial_ends_at DATETIME,
        ADD COLUMN last_payment_date DATETIME
    `);
}

async function down(connection) {
    await connection.execute(`
        ALTER TABLE users 
        DROP COLUMN subscription_type,
        DROP COLUMN trial_ends_at,
        DROP COLUMN last_payment_date
    `);
}

module.exports = { up, down };
```

### Breaking Changes

#### v2.0.0 → v3.0.0
- **Database Schema**: Added multi-tenant support
- **API Changes**: New authentication method
- **Configuration**: Updated environment variables

#### Migration Steps
1. Backup database dan aplikasi
2. Update database schema
3. Update configuration files
4. Test functionality
5. Update API integration

---

## 📄 Lisensi

### MIT License

Copyright (c) 2025 Eko Adrie - eglobaltech.id

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

### Penggunaan Komersial

✅ **Diizinkan:**
- Penggunaan untuk project komersial
- Modifikasi source code
- Distribusi ulang
- Penggunaan pribadi

⚠️ **Kewajiban:**
- Menyertakan copyright notice
- Menyertakan lisensi MIT
- Tidak ada jaminan dari pembuat

❌ **Tidak Diizinkan:**
- Mengklaim sebagai karya sendiri
- Menghapus copyright notice
- Menggunakan nama/brand tanpa izin

---

## 🤝 Kontribusi

### Cara Berkontribusi

1. **Fork Repository**
2. **Create Feature Branch**
   ```bash
   git checkout -b feature/amazing-feature
   ```
3. **Commit Changes**
   ```bash
   git commit -m 'Add amazing feature'
   ```
4. **Push to Branch**
   ```bash
   git push origin feature/amazing-feature
   ```
5. **Create Pull Request**

### Development Guidelines

#### Code Style
- Gunakan ESLint configuration
- Follow JavaScript Standard Style
- Dokumentasi untuk semua functions
- Unit tests untuk fitur baru

#### Commit Messages
```
feat: add new WhatsApp feature
fix: resolve database connection issue
docs: update API documentation
style: fix code formatting
refactor: improve error handling
test: add unit tests for auth
```

---

## 📞 Support

### Bantuan & Dukungan

- **Email**: support@eglobaltech.id
- **Website**: https://eglobaltech.id
- **Documentation**: https://docs.eglobaltech.id
- **Issues**: https://github.com/your-repo/wabot-api/issues

### Community

- **Telegram**: @eglobaltech_support
- **Discord**: eglobaltech.id/discord
- **Forum**: https://forum.eglobaltech.id

---

## 🎉 Acknowledgments

- **WhatsApp Web.js**: Library untuk WhatsApp integration
- **Express.js**: Web framework untuk Node.js
- **MySQL**: Database management system
- **Bootstrap**: UI framework
- **Font Awesome**: Icon library

---

## 📊 Statistics

![GitHub stars](https://img.shields.io/github/stars/your-repo/wabot-api?style=social)
![GitHub forks](https://img.shields.io/github/forks/your-repo/wabot-api?style=social)
![GitHub issues](https://img.shields.io/github/issues/your-repo/wabot-api)
![GitHub pull requests](https://img.shields.io/github/issues-pr/your-repo/wabot-api)

---

**© 2025 Eko Adrie - eglobaltech.id. All rights reserved.** 