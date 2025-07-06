# Database Import Scripts

Direktori ini berisi script SQL untuk setup database WhatsApp Multi-Tenant SaaS Platform.

## 📁 Files Available

### 1. Production-Ready Scripts
- **`complete-vps-import.sql`** - Script lengkap dengan transaction handling dan verification
- **`quick-import.sql`** - Script simpel untuk import cepat
- **`schema-vps.sql`** - Schema database VPS-compatible
- **`migration-vps.sql`** - Migration script untuk update existing database

### 2. Development Scripts
- **`schema.sql`** - Schema database untuk development (MySQL 8.0+)
- **`migration.sql`** - Migration script untuk development

## 🚀 Quick Start

### Option 1: Complete Import (Recommended)
```bash
mysql -u root -p < database/complete-vps-import.sql
```

### Option 2: Quick Import
```bash
mysql -u root -p < database/quick-import.sql
```

### Option 3: Via phpMyAdmin
1. Login ke phpMyAdmin
2. Import file `complete-vps-import.sql` atau `quick-import.sql`

## 🔧 Manual Setup

Jika import otomatis gagal:

```sql
-- 1. Buat database
CREATE DATABASE wabot_api;
USE wabot_api;

-- 2. Copy-paste isi file quick-import.sql
-- 3. Execute
```

## ✅ Verify Import

Setelah import, test dengan:

```bash
npm run test-database
```

Atau manual check:

```sql
USE wabot_api;
SHOW TABLES;
SELECT * FROM users WHERE role = 'admin';
SELECT COUNT(*) FROM system_settings;
```

## 📊 Database Structure

Setelah import berhasil, terbuat 8 tabel:

### Core Tables
1. **`users`** - User management dengan multi-tenant support
   - Basic auth: username, password, api_key
   - Multi-tenant: whatsapp_number, is_active, payment_status
   - Subscription: subscription_type, expired_date, trial_ends_at

2. **`message_stats`** - Message tracking per user
   - Track semua pesan yang dikirim
   - Success/failure statistics
   - Message length tracking

### User-Specific Tables
3. **`user_contacts`** - Contact management per user
4. **`user_groups`** - Group management per user  
5. **`user_connections`** - WhatsApp connection status
6. **`user_payments`** - Billing dan payment history
7. **`user_api_usage`** - API usage tracking

### System Table
8. **`system_settings`** - System configuration

## 🔐 Default Credentials

Setelah import:
- **Username:** admin
- **Password:** admin123
- **Role:** admin

## 🛠️ Troubleshooting

### Error: Unknown collation
```sql
-- Gunakan script VPS-compatible
mysql -u root -p < database/schema-vps.sql
```

### Error: Table exists
```sql
DROP DATABASE IF EXISTS wabot_api;
-- Import ulang
```

### Error: Foreign key constraint
```sql
SET FOREIGN_KEY_CHECKS = 0;
-- Import database
SET FOREIGN_KEY_CHECKS = 1;
```

## 🔄 Migration

Untuk update existing database:

```bash
# Backup dulu
mysqldump -u root -p wabot_api > backup.sql

# Import migration
mysql -u root -p < database/migration-vps.sql
```

## 📋 Compatibility

| Script | MySQL Version | MariaDB Version | Notes |
|--------|---------------|-----------------|-------|
| `complete-vps-import.sql` | 5.7+ | 10.2+ | Production ready |
| `quick-import.sql` | 5.7+ | 10.2+ | Simple import |
| `schema-vps.sql` | 5.7+ | 10.2+ | VPS compatible |
| `schema.sql` | 8.0+ | 10.4+ | Development only |

## 🧪 Testing

Test database import:

```bash
# Test via npm script
npm run test-database

# Test manual
node test-database-import.js
```

Expected results:
- ✅ 8 tables created
- ✅ 1 admin user
- ✅ 8 system settings
- ✅ 6 foreign key constraints

## 📞 Support

Jika ada masalah:

1. **Check logs:** `tail -f logs/app.log`
2. **Test connection:** `npm run test-db`
3. **Verify config:** Check `config/database.js`

## 🎯 Next Steps

Setelah database import berhasil:

1. Update `config/database.js` dengan kredensial VPS
2. Run aplikasi: `npm start`
3. Login sebagai admin
4. Setup WhatsApp connection
5. Test API endpoints

---

**Note:** Semua script sudah dioptimalkan untuk production deployment di VPS dengan MySQL 5.7+ atau MariaDB 10.2+. 