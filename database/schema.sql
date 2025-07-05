-- Buat database jika belum ada
CREATE DATABASE IF NOT EXISTS wabot_db;
USE wabot_db;

-- Buat tabel users
CREATE TABLE IF NOT EXISTS users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Buat user admin dengan kredensial yang sama seperti di .env
-- Password: admin123
INSERT INTO users (username, password) VALUES 
('admin', '$2a$10$XFE/UQoGYOUzFrN8.ZKnZu4RDvz.FY4P1FopYHkUKHF.U.S.i9arm')
ON DUPLICATE KEY UPDATE id=id;

-- Note: Password yang di-hash di atas adalah 'admin123' menggunakan bcrypt
-- Ini sama dengan LOGIN_PASSWORD di file .env 