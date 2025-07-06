# 🌐 VPS Database Import Guide

## 🚨 **Solusi untuk Error: Unknown collation 'utf8mb4_0900_ai_ci'**

Error ini terjadi karena collation `utf8mb4_0900_ai_ci` hanya tersedia di MySQL 8.0+, sedangkan VPS biasanya menggunakan MySQL 5.7 atau MariaDB.

## 🎯 **Solusi Lengkap untuk VPS:**

### **Solusi 1: Gunakan File VPS-Compatible (Recommended)**

#### **File Database Khusus VPS:**
```
database/
├── schema-vps.sql      ← Import PERTAMA (VPS compatible)
├── migration-vps.sql   ← Import KEDUA (VPS compatible)
```

#### **Langkah Import VPS:**
```bash
# 1. Login ke MySQL VPS
mysql -u username -p

# 2. Create database
CREATE DATABASE wabot_api CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE wabot_api;

# 3. Import schema VPS
SOURCE /path/to/database/schema-vps.sql;

# 4. Import migration VPS
SOURCE /path/to/database/migration-vps.sql;

# 5. Verify
SHOW TABLES;
```

### **Solusi 2: Fix Collation Otomatis**

#### **Dari Localhost (sebelum upload):**
```bash
# Fix collation di file database
npm run fix-collation

# Upload file yang sudah di-fix ke VPS
# Kemudian import seperti biasa
```

### **Solusi 3: Manual Edit (jika diperlukan)**

#### **Edit File SQL Manual:**
```sql
-- Ganti semua instance ini:
utf8mb4_0900_ai_ci → utf8mb4_unicode_ci
utf8_0900_ai_ci → utf8_unicode_ci

-- Contoh:
-- DARI:
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- MENJADI:
DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
```

## 📋 **Panduan Import VPS Step-by-Step:**

### **Step 1: Persiapan File**

#### **Option A: Download File VPS-Ready**
```bash
# Download dari GitHub
wget https://raw.githubusercontent.com/okebill/whatsapp-okebill/main/database/schema-vps.sql
wget https://raw.githubusercontent.com/okebill/whatsapp-okebill/main/database/migration-vps.sql
```

#### **Option B: Fix File Existing**
```bash
# Jika sudah punya file di localhost
npm run fix-collation
# Upload schema.sql dan migration-fixed.sql yang sudah di-fix
```

### **Step 2: Import ke VPS**

#### **Via SSH Command Line:**
```bash
# Login ke VPS
ssh user@your-vps-ip

# Login ke MySQL
mysql -u root -p

# Create database dengan collation yang benar
CREATE DATABASE wabot_api CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE wabot_api;

# Import file pertama
SOURCE /path/to/schema-vps.sql;

# Import file kedua
SOURCE /path/to/migration-vps.sql;

# Verify import
SHOW TABLES;
SELECT COUNT(*) FROM users;
SELECT COUNT(*) FROM system_settings;
```

#### **Via phpMyAdmin (jika tersedia):**
1. **Login** ke phpMyAdmin VPS
2. **Create Database:**
   - Name: `wabot_api`
   - Collation: `utf8mb4_unicode_ci`
3. **Import schema-vps.sql**
4. **Import migration-vps.sql**

### **Step 3: Verifikasi Import**

#### **Check Tables (harus 8 tabel):**
```sql
SHOW TABLES;
```

**Expected Output:**
```
+-------------------------+
| Tables_in_wabot_api     |
+-------------------------+
| message_stats           |
| system_settings         |
| user_api_usage         |
| user_connections       |
| user_contacts          |
| user_groups            |
| user_payments          |
| users                  |
+-------------------------+
```

#### **Check Admin User:**
```sql
SELECT id, username, role, is_active FROM users WHERE role = 'admin';
```

#### **Check System Settings:**
```sql
SELECT COUNT(*) as total_settings FROM system_settings;
-- Should return 8
```

## 🔧 **Troubleshooting VPS Issues:**

### **Issue 1: JSON Column Error (MariaDB)**
```sql
-- Jika VPS menggunakan MariaDB < 10.3, ganti JSON dengan TEXT
ALTER TABLE user_connections MODIFY COLUMN device_info TEXT;
ALTER TABLE user_api_usage MODIFY COLUMN request_data TEXT;
```

### **Issue 2: Boolean Column Error**
```sql
-- Jika error dengan BOOLEAN, ganti dengan TINYINT(1)
-- Sudah diatasi di file VPS-compatible
```

### **Issue 3: Permission Denied**
```sql
-- Grant permission untuk user database
GRANT ALL PRIVILEGES ON wabot_api.* TO 'username'@'localhost';
FLUSH PRIVILEGES;
```

### **Issue 4: Foreign Key Error**
```sql
-- Disable foreign key check sementara
SET FOREIGN_KEY_CHECKS = 0;
-- Import database
-- Enable kembali
SET FOREIGN_KEY_CHECKS = 1;
```

## 📊 **Compatibility Matrix:**

| MySQL Version | Collation Support | Recommended File |
|---------------|-------------------|------------------|
| MySQL 8.0+    | utf8mb4_0900_ai_ci | schema.sql + migration-fixed.sql |
| MySQL 5.7     | utf8mb4_unicode_ci | schema-vps.sql + migration-vps.sql |
| MariaDB 10.3+ | utf8mb4_unicode_ci | schema-vps.sql + migration-vps.sql |
| MariaDB 10.2  | utf8mb4_unicode_ci + JSON→TEXT | Manual edit required |

## 🚀 **Production VPS Setup:**

### **Complete VPS Setup Script:**
```bash
#!/bin/bash
# VPS Setup Script

# 1. Create database
mysql -u root -p -e "
CREATE DATABASE wabot_api CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE wabot_api;
SOURCE schema-vps.sql;
SOURCE migration-vps.sql;
"

# 2. Verify
mysql -u root -p -e "
USE wabot_api;
SHOW TABLES;
SELECT 'Import completed!' as status;
"

echo "✅ VPS Database setup completed!"
```

### **Application Configuration:**
```javascript
// config/database.js untuk VPS
module.exports = {
  host: 'localhost', // atau IP database VPS
  user: 'your_db_user',
  password: 'your_strong_password',
  database: 'wabot_api',
  charset: 'utf8mb4',
  collation: 'utf8mb4_unicode_ci',
  timezone: '+07:00'
};
```

## 📞 **VPS Support:**

### **Common VPS Providers:**
- **DigitalOcean**: MySQL 5.7 (use schema-vps.sql)
- **Vultr**: MySQL 5.7/8.0 (check version first)
- **Linode**: MySQL 8.0 (can use original files)
- **AWS RDS**: MySQL 8.0 (can use original files)
- **Google Cloud SQL**: MySQL 8.0 (can use original files)

### **Check MySQL Version:**
```sql
SELECT VERSION();
```

### **Check Collation Support:**
```sql
SHOW COLLATION LIKE 'utf8mb4%';
```

---

## 🎉 **Kesimpulan:**

**Untuk VPS dengan MySQL 5.7/MariaDB, gunakan:**
1. `database/schema-vps.sql` (import pertama)
2. `database/migration-vps.sql` (import kedua)

**File ini sudah di-optimize untuk kompatibilitas VPS dan tidak akan menghasilkan error collation!**

**✅ Database multi-tenant WhatsApp SaaS siap deploy di VPS!** 🚀 