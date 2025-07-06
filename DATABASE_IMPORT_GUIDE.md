# 📊 Database Import Guide - MySQL

## 🎯 Overview
Panduan lengkap untuk import database WhatsApp SaaS Multi-Tenant ke MySQL server.

## 📋 Available Database Files

### 1. **database/schema.sql** (Basic Setup)
- Database dan tabel dasar
- User admin default
- Message stats tracking
- **Recommended for**: Fresh installation

### 2. **database/migration-fixed.sql** (Multi-Tenant Upgrade)
- Upgrade ke multi-tenant platform
- 8 tabel baru untuk SaaS features
- Billing dan subscription system
- **Recommended for**: Existing installation upgrade

### 3. **database/migration.sql** (Original Migration)
- Versi original (mungkin ada compatibility issues)
- **Not recommended**: Gunakan migration-fixed.sql

## 🚀 Import Methods

### Method 1: Fresh Installation (Recommended)

#### A. Via Command Line (Recommended)
```bash
# 1. Login ke MySQL
mysql -u root -p

# 2. Create database
CREATE DATABASE wabot_api;
USE wabot_api;

# 3. Import schema dasar
SOURCE /path/to/wabot-api/database/schema.sql;

# 4. Import multi-tenant features
SOURCE /path/to/wabot-api/database/migration-fixed.sql;

# 5. Verify import
SHOW TABLES;
```

#### B. Via phpMyAdmin (GUI)
1. **Login** ke phpMyAdmin
2. **Create Database**: 
   - Database name: `wabot_api`
   - Collation: `utf8mb4_unicode_ci`
3. **Import schema.sql**:
   - Click "Import" tab
   - Choose file: `database/schema.sql`
   - Click "Go"
4. **Import migration-fixed.sql**:
   - Choose file: `database/migration-fixed.sql`
   - Click "Go"

### Method 2: Single Command Import

#### Complete Setup (One Command)
```bash
# Create database and import everything
mysql -u root -p -e "
CREATE DATABASE IF NOT EXISTS wabot_api;
USE wabot_api;
SOURCE $(pwd)/database/schema.sql;
SOURCE $(pwd)/database/migration-fixed.sql;
"
```

#### Windows Command (PowerShell)
```powershell
# Navigate to project directory
cd C:\laragon\www\wabot-api

# Import database
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS wabot_api; USE wabot_api; SOURCE database/schema.sql; SOURCE database/migration-fixed.sql;"
```

### Method 3: Automated Script

Mari saya buat script otomatis untuk import:

```bash
# Run automated import
npm run setup-database
```

## 🔧 Database Configuration

### 1. Update config/database.js
```javascript
module.exports = {
  host: 'localhost',
  user: 'root',
  password: 'your_mysql_password',
  database: 'wabot_api',
  charset: 'utf8mb4',
  timezone: '+07:00'
};
```

### 2. Update .env file
```env
# Database Configuration
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=your_mysql_password
DB_NAME=wabot_api
DB_PORT=3306
```

## 📊 Database Structure After Import

### Core Tables
1. **users** - User management dengan multi-tenant support
2. **message_stats** - Message tracking per user
3. **user_contacts** - Contact management per user
4. **user_groups** - Group management per user
5. **user_connections** - WhatsApp connection status
6. **user_payments** - Billing dan payment history
7. **user_api_usage** - API usage tracking
8. **system_settings** - System configuration

### Default Data
- **Admin User**: username `admin`, password `admin123`
- **System Settings**: Trial period, pricing, etc.
- **Indexes**: Optimized for performance

## 🔍 Verification Steps

### 1. Check Tables
```sql
USE wabot_api;
SHOW TABLES;
-- Should show 8 tables
```

### 2. Check User Data
```sql
SELECT id, username, role, is_active, payment_status FROM users;
-- Should show admin user
```

### 3. Check System Settings
```sql
SELECT setting_key, setting_value FROM system_settings;
-- Should show 8 default settings
```

### 4. Test Connection
```bash
# Test database connection
node -e "
const db = require('./config/database');
const mysql = require('mysql2/promise');
mysql.createConnection(db).then(() => {
  console.log('✅ Database connected successfully!');
  process.exit(0);
}).catch(err => {
  console.error('❌ Database connection failed:', err);
  process.exit(1);
});
"
```

## 🚨 Common Issues & Solutions

### Issue 1: Database Connection Error
```bash
# Check MySQL service
# Windows (XAMPP)
net start mysql

# Linux
sudo systemctl start mysql
sudo systemctl status mysql
```

### Issue 2: Permission Denied
```sql
-- Grant permissions to user
GRANT ALL PRIVILEGES ON wabot_api.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
```

### Issue 3: Character Set Issues
```sql
-- Set proper charset
ALTER DATABASE wabot_api CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### Issue 4: Import Errors
```bash
# Check MySQL error log
# Windows: C:\xampp\mysql\data\mysql_error.log
# Linux: /var/log/mysql/error.log
```

## 🛠️ Advanced Setup

### 1. Production Optimization
```sql
-- Add additional indexes for production
CREATE INDEX idx_users_created_at ON users(created_at);
CREATE INDEX idx_message_stats_sent_at ON message_stats(sent_at);
CREATE INDEX idx_user_payments_payment_date ON user_payments(payment_date);
```

### 2. Backup Strategy
```bash
# Create backup
mysqldump -u root -p wabot_api > wabot_api_backup.sql

# Restore backup
mysql -u root -p wabot_api < wabot_api_backup.sql
```

### 3. User Management
```sql
-- Create additional admin user
INSERT INTO users (username, password, role, is_active, payment_status) 
VALUES ('admin2', '$2a$10$XFE/UQoGYOUzFrN8.ZKnZu4RDvz.FY4P1FopYHkUKHF.U.S.i9arm', 'admin', 1, 'active');
```

## 📱 Testing After Import

### 1. Start Application
```bash
npm start
```

### 2. Test Login
- URL: `http://localhost:1992/auth/login`
- Username: `admin`
- Password: `admin123`

### 3. Test Registration
- URL: `http://localhost:1992/auth/register`
- Create test user

### 4. Test API
```bash
curl -X POST http://localhost:1992/api/status \
  -H "api-key: your_api_key"
```

## 🔐 Security Considerations

### 1. Change Default Passwords
```sql
-- Update admin password
UPDATE users SET password = '$2a$10$NEW_HASH_HERE' WHERE username = 'admin';
```

### 2. Database Security
- Use strong MySQL root password
- Create dedicated database user
- Limit database access by IP
- Enable SSL connections

### 3. Backup & Recovery
- Schedule regular backups
- Test restore procedures
- Store backups securely

## 📞 Support

If you encounter issues:
1. Check MySQL error logs
2. Verify database credentials
3. Ensure MySQL service is running
4. Check file permissions
5. Review network connectivity

---

**🎉 Database import completed! Your multi-tenant WhatsApp SaaS platform is ready to use.** 