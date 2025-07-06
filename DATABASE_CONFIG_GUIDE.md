# 🔧 Database Configuration Guide

Panduan lengkap untuk mengkonfigurasi database WhatsApp Multi-Tenant SaaS Platform di VPS.

## 📍 File Konfigurasi Database

File utama yang perlu diubah: **`config/database.js`**

```
wabot-api/
├── config/
│   └── database.js  ← File konfigurasi database
├── env.example      ← Template environment variables
└── .env             ← File environment (buat manual)
```

## ⚙️ Method 1: Direct Configuration (Recommended)

Edit file **`config/database.js`** langsung:

```javascript
module.exports = {
  host: 'localhost',                    // Ganti dengan IP VPS jika remote
  user: 'your_mysql_username',          // Username MySQL VPS
  password: 'your_mysql_password',      // Password MySQL VPS
  database: 'wabot_api',                // Nama database
  port: 3306,                           // Port MySQL (default: 3306)
  
  // Connection pool settings
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
  acquireTimeout: 60000,
  timeout: 60000,
  reconnect: true
};
```

## 🔐 Method 2: Environment Variables (Secure)

1. **Buat file `.env`** di root project:
```bash
# Copy template
cp env.example .env
```

2. **Edit file `.env`**:
```env
DB_HOST=localhost
DB_USER=your_mysql_username
DB_PASS=your_mysql_password
DB_NAME=wabot_api
DB_PORT=3306
```

3. **File `config/database.js` otomatis membaca dari `.env`**

## 📋 Contoh Konfigurasi Berdasarkan Hosting

### 🏠 VPS Localhost (Same Server)
```javascript
{
  host: 'localhost',
  user: 'root',
  password: 'your_root_password',
  database: 'wabot_api',
  port: 3306
}
```

### 🌐 VPS Remote Database
```javascript
{
  host: '192.168.1.100',              // IP database server
  user: 'wabot_user',
  password: 'secure_password',
  database: 'wabot_api',
  port: 3306
}
```

### ☁️ Cloud Database (DigitalOcean, AWS RDS, etc.)
```javascript
{
  host: 'db-mysql-sgp1-12345.ondigitalocean.com',
  user: 'doadmin',
  password: 'your_cloud_db_password',
  database: 'wabot_api',
  port: 25060,
  ssl: {
    rejectUnauthorized: false
  }
}
```

### 🏢 Shared Hosting (cPanel)
```javascript
{
  host: 'localhost',
  user: 'cpanel_username_dbuser',      // Format: username_dbuser
  password: 'database_password',
  database: 'cpanel_username_wabot_api', // Format: username_dbname
  port: 3306
}
```

## 🔍 Cara Mendapatkan Kredensial Database

### VPS dengan Root Access
```bash
# Login ke VPS
ssh root@your_vps_ip

# Login ke MySQL
mysql -u root -p

# Buat database dan user
CREATE DATABASE wabot_api;
CREATE USER 'wabot_user'@'localhost' IDENTIFIED BY 'secure_password';
GRANT ALL PRIVILEGES ON wabot_api.* TO 'wabot_user'@'localhost';
FLUSH PRIVILEGES;
```

### cPanel Hosting
1. Login ke cPanel
2. Buka "MySQL Databases"
3. Buat database baru: `wabot_api`
4. Buat user baru: `wabot_user`
5. Assign user ke database
6. Catat kredensial yang dibuat

### Cloud Database
1. Buat database instance di cloud provider
2. Catat connection string yang diberikan
3. Whitelist IP VPS aplikasi
4. Test koneksi

## ✅ Test Konfigurasi Database

Setelah mengkonfigurasi, test koneksi:

```bash
# Test database connection
npm run test-db

# Atau manual test
node -e "
const db = require('./config/database');
const mysql = require('mysql2');
const conn = mysql.createConnection(db);
conn.connect(err => {
  if (err) {
    console.log('❌ Database connection failed:', err.message);
  } else {
    console.log('✅ Database connected successfully!');
    conn.end();
  }
});
"
```

## 🛠️ Troubleshooting

### Error: "Access denied for user"
```bash
# Solusi: Periksa username dan password
# Update config/database.js dengan kredensial yang benar
```

### Error: "Can't connect to MySQL server"
```bash
# Solusi: Periksa host dan port
# Pastikan MySQL service berjalan
sudo systemctl status mysql
sudo systemctl start mysql
```

### Error: "Unknown database"
```bash
# Solusi: Buat database terlebih dahulu
mysql -u root -p
CREATE DATABASE wabot_api;
```

### Error: "Connection timeout"
```bash
# Solusi: Periksa firewall dan network
# Buka port 3306 di firewall
sudo ufw allow 3306
```

## 🔐 Security Best Practices

### 1. Gunakan User Database Khusus
```sql
-- Jangan gunakan root user untuk aplikasi
CREATE USER 'wabot_user'@'localhost' IDENTIFIED BY 'strong_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON wabot_api.* TO 'wabot_user'@'localhost';
```

### 2. Gunakan Environment Variables
```bash
# Jangan hardcode password di config file
# Gunakan .env file untuk production
```

### 3. Restrict Database Access
```sql
-- Hanya allow koneksi dari IP tertentu
CREATE USER 'wabot_user'@'192.168.1.100' IDENTIFIED BY 'password';
```

### 4. Backup Database Regularly
```bash
# Setup automated backup
mysqldump -u wabot_user -p wabot_api > backup_$(date +%Y%m%d).sql
```

## 📊 Database Configuration Examples

### Development (Local)
```javascript
{
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'wabot_api_dev'
}
```

### Staging (Test Server)
```javascript
{
  host: 'staging.example.com',
  user: 'staging_user',
  password: 'staging_pass',
  database: 'wabot_api_staging'
}
```

### Production (Live Server)
```javascript
{
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  database: process.env.DB_NAME,
  ssl: { rejectUnauthorized: false }
}
```

## 🎯 Next Steps

Setelah konfigurasi database berhasil:

1. **Import database:** `mysql -u root -p < database/complete-vps-import.sql`
2. **Test koneksi:** `npm run test-db`
3. **Start aplikasi:** `npm start`
4. **Login admin:** username: `admin`, password: `admin123`

## 📞 Support

Jika masih ada masalah:
1. Cek log aplikasi: `tail -f logs/app.log`
2. Cek MySQL error log: `tail -f /var/log/mysql/error.log`
3. Test manual connection dengan MySQL client

---

**Note:** Pastikan firewall VPS sudah membuka port 3306 untuk koneksi database dan port 3000 untuk aplikasi web. 