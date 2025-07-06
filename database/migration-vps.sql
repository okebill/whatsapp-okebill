-- ===================================
-- EGLOBALTECH WA-GATEWAY MIGRATION (VPS Compatible)
-- Multi-Tenant SaaS Platform (MySQL 5.7+ / MariaDB 10.2+)
-- ===================================

-- Update users table for multi-tenant and billing
ALTER TABLE users ADD COLUMN whatsapp_number VARCHAR(20) UNIQUE;
ALTER TABLE users ADD COLUMN is_active BOOLEAN DEFAULT FALSE;
ALTER TABLE users ADD COLUMN approved_by INT;
ALTER TABLE users ADD COLUMN approved_at TIMESTAMP NULL;
ALTER TABLE users ADD COLUMN subscription_type ENUM('free', 'monthly', 'yearly') DEFAULT 'free';
ALTER TABLE users ADD COLUMN expired_date DATE;
ALTER TABLE users ADD COLUMN created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users ADD COLUMN last_payment_date DATE;
ALTER TABLE users ADD COLUMN payment_status ENUM('active', 'expired', 'suspended', 'trial') DEFAULT 'trial';
ALTER TABLE users ADD COLUMN trial_ends_at DATE;
ALTER TABLE users ADD COLUMN phone_number VARCHAR(20);
ALTER TABLE users ADD COLUMN email VARCHAR(100);
ALTER TABLE users ADD COLUMN full_name VARCHAR(255) DEFAULT NULL;

-- User-specific contacts (isolated per user)
CREATE TABLE user_contacts (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  contact_name VARCHAR(255) NOT NULL,
  contact_phone VARCHAR(20) NOT NULL,
  contact_avatar TEXT,
  is_business BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  UNIQUE KEY unique_user_contact (user_id, contact_phone)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- User-specific groups (isolated per user)
CREATE TABLE user_groups (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  group_id VARCHAR(255) NOT NULL,
  group_name VARCHAR(255) NOT NULL,
  group_description TEXT,
  participants_count INT DEFAULT 0,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  UNIQUE KEY unique_user_group (user_id, group_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- User connection status and session management
CREATE TABLE user_connections (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  whatsapp_number VARCHAR(20),
  connection_status ENUM('connected', 'disconnected', 'scanning', 'connecting') DEFAULT 'disconnected',
  last_connected TIMESTAMP,
  last_disconnected TIMESTAMP,
  session_path VARCHAR(255),
  qr_code TEXT,
  device_info JSON,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  UNIQUE KEY unique_user_connection (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Payment history and billing
CREATE TABLE user_payments (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  currency VARCHAR(3) DEFAULT 'IDR',
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  expired_date DATE NOT NULL,
  payment_method VARCHAR(50),
  transaction_id VARCHAR(100),
  invoice_number VARCHAR(50),
  status ENUM('pending', 'paid', 'failed', 'refunded') DEFAULT 'pending',
  notes TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  UNIQUE KEY unique_transaction (transaction_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Update message_stats for multi-tenant (modify existing table)
ALTER TABLE message_stats ADD COLUMN target_type ENUM('personal', 'group') DEFAULT 'personal';
ALTER TABLE message_stats MODIFY COLUMN sender_number VARCHAR(20) NULL;
ALTER TABLE message_stats MODIFY COLUMN target_type ENUM('personal', 'group') DEFAULT 'personal';
ALTER TABLE message_stats MODIFY COLUMN message_length INT DEFAULT 0;
ALTER TABLE message_stats MODIFY COLUMN success BOOLEAN DEFAULT TRUE;

-- User API usage tracking
CREATE TABLE user_api_usage (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  endpoint VARCHAR(100) NOT NULL,
  method VARCHAR(10) NOT NULL,
  ip_address VARCHAR(45),
  user_agent TEXT,
  request_data JSON,
  response_status INT,
  response_time_ms INT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  INDEX idx_user_date (user_id, created_at),
  INDEX idx_endpoint (endpoint)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- System settings for admin
CREATE TABLE system_settings (
  id INT PRIMARY KEY AUTO_INCREMENT,
  setting_key VARCHAR(100) NOT NULL UNIQUE,
  setting_value TEXT,
  setting_type ENUM('string', 'number', 'boolean', 'json') DEFAULT 'string',
  description TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert default system settings
INSERT INTO system_settings (setting_key, setting_value, setting_type, description) VALUES
('trial_duration_days', '7', 'number', 'Trial period duration in days'),
('monthly_price', '50000', 'number', 'Monthly subscription price in IDR'),
('yearly_price', '500000', 'number', 'Yearly subscription price in IDR'),
('max_users_per_server', '100', 'number', 'Maximum users allowed per server'),
('auto_approval', 'false', 'boolean', 'Auto approve new user registrations'),
('maintenance_mode', 'false', 'boolean', 'Enable maintenance mode'),
('app_name', 'Eglobaltech WA-Gateway', 'string', 'Application name'),
('admin_email', 'admin@eglobaltech.id', 'string', 'Admin email for notifications');

-- Create indexes for performance
CREATE INDEX idx_users_active ON users(is_active);
CREATE INDEX idx_users_payment_status ON users(payment_status);
CREATE INDEX idx_users_expired_date ON users(expired_date);
CREATE INDEX idx_user_contacts_user_id ON user_contacts(user_id);
CREATE INDEX idx_user_groups_user_id ON user_groups(user_id);
CREATE INDEX idx_user_connections_status ON user_connections(connection_status);
CREATE INDEX idx_user_payments_user_id ON user_payments(user_id);
CREATE INDEX idx_user_payments_status ON user_payments(status);
CREATE INDEX idx_message_stats_user_id ON message_stats(user_id);

-- Set trial period for existing users
UPDATE users SET 
  trial_ends_at = DATE_ADD(CURDATE(), INTERVAL 7 DAY),
  payment_status = 'trial'
WHERE trial_ends_at IS NULL;

-- Migration completed
SELECT 'VPS Database migration completed successfully!' as message; 