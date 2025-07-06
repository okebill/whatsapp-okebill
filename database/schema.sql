-- Buat database jika belum ada
CREATE DATABASE IF NOT EXISTS wabot_db;
USE wabot_db;

-- Buat tabel users
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  api_key VARCHAR(64) UNIQUE,
  whatsapp_device_id VARCHAR(255),
  whatsapp_device_name VARCHAR(255),
  last_connected TIMESTAMP NULL,
  role VARCHAR(20) DEFAULT 'user',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tambahkan kolom baru jika belum ada (untuk upgrade database lama)
ALTER TABLE users 
ADD COLUMN IF NOT EXISTS whatsapp_device_id VARCHAR(255),
ADD COLUMN IF NOT EXISTS whatsapp_device_name VARCHAR(255),
ADD COLUMN IF NOT EXISTS last_connected TIMESTAMP NULL,
ADD COLUMN IF NOT EXISTS role VARCHAR(20) DEFAULT 'user';

-- Ubah ukuran api_key jika masih 32 karakter
ALTER TABLE users MODIFY COLUMN api_key VARCHAR(64) UNIQUE;

-- Buat tabel message_stats untuk tracking pesan
CREATE TABLE IF NOT EXISTS message_stats (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  sender_number VARCHAR(20) NOT NULL,
  target_number VARCHAR(255) NOT NULL,
  target_type ENUM('personal', 'group') DEFAULT 'personal',
  message_length INT DEFAULT 0,
  success BOOLEAN DEFAULT TRUE,
  error_message TEXT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  INDEX idx_user_id (user_id),
  INDEX idx_sender_number (sender_number),
  INDEX idx_sent_at (sent_at),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Generate API Key untuk user admin jika belum ada
UPDATE users 
SET api_key = COALESCE(api_key, SUBSTRING(MD5(RAND()) FROM 1 FOR 32))
WHERE username = 'admin';

-- Buat user admin dengan kredensial yang sama seperti di .env
-- Password: admin123
INSERT INTO users (username, password, api_key, role) VALUES 
('admin', '$2a$10$XFE/UQoGYOUzFrN8.ZKnZu4RDvz.FY4P1FopYHkUKHF.U.S.i9arm', SUBSTRING(MD5(RAND()) FROM 1 FOR 32), 'admin')
ON DUPLICATE KEY UPDATE id=id;

-- Note: Password yang di-hash di atas adalah 'admin123' menggunakan bcrypt
-- Ini sama dengan LOGIN_PASSWORD di file .env 