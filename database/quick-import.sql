-- =============================================
-- QUICK IMPORT SQL SCRIPT
-- WhatsApp Multi-Tenant SaaS Platform
-- For fast VPS import - Compatible with all MySQL versions
-- =============================================

-- Create database
CREATE DATABASE IF NOT EXISTS `wabot_api`;
USE `wabot_api`;

-- Users table (enhanced for multi-tenant)
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `api_key` varchar(64) DEFAULT NULL,
  `whatsapp_device_id` varchar(255) DEFAULT NULL,
  `whatsapp_device_name` varchar(255) DEFAULT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `last_connected` timestamp NULL DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user',
  `is_active` tinyint(1) DEFAULT '0',
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `subscription_type` enum('free','monthly','yearly') DEFAULT 'free',
  `expired_date` date DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `payment_status` enum('active','expired','suspended','trial') DEFAULT 'trial',
  `trial_ends_at` date DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `api_key` (`api_key`),
  UNIQUE KEY `whatsapp_number` (`whatsapp_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Message stats table
CREATE TABLE `message_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sender_number` varchar(20) DEFAULT NULL,
  `target_number` varchar(255) NOT NULL,
  `target_type` enum('personal','group') DEFAULT 'personal',
  `message_length` int(11) DEFAULT '0',
  `success` tinyint(1) DEFAULT '1',
  `error_message` text,
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `message_stats_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- User contacts table
CREATE TABLE `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_phone` varchar(20) NOT NULL,
  `contact_avatar` text,
  `is_business` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_contact` (`user_id`,`contact_phone`),
  CONSTRAINT `user_contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- User groups table
CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` varchar(255) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `group_description` text,
  `participants_count` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_group` (`user_id`,`group_id`),
  CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- User connections table
CREATE TABLE `user_connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `connection_status` enum('connected','disconnected','scanning','connecting') DEFAULT 'disconnected',
  `last_connected` timestamp NULL DEFAULT NULL,
  `last_disconnected` timestamp NULL DEFAULT NULL,
  `session_path` varchar(255) DEFAULT NULL,
  `qr_code` text,
  `device_info` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_connection` (`user_id`),
  CONSTRAINT `user_connections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- User payments table
CREATE TABLE `user_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) DEFAULT 'IDR',
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expired_date` date NOT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `invoice_number` varchar(50) DEFAULT NULL,
  `status` enum('pending','paid','failed','refunded') DEFAULT 'pending',
  `notes` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_transaction` (`transaction_id`),
  CONSTRAINT `user_payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- User API usage table
CREATE TABLE `user_api_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `endpoint` varchar(100) NOT NULL,
  `method` varchar(10) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `request_data` text,
  `response_status` int(11) DEFAULT NULL,
  `response_time_ms` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_date` (`user_id`,`created_at`),
  CONSTRAINT `user_api_usage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- System settings table
CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text,
  `setting_type` enum('string','number','boolean','json') DEFAULT 'string',
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Insert default admin user (password: admin123)
INSERT INTO `users` (`username`, `password`, `api_key`, `role`, `is_active`, `payment_status`) VALUES 
('admin', '$2a$10$XFE/UQoGYOUzFrN8.ZKnZu4RDvz.FY4P1FopYHkUKHF.U.S.i9arm', SUBSTRING(MD5(RAND()) FROM 1 FOR 32), 'admin', 1, 'active');

-- Insert default system settings
INSERT INTO `system_settings` (`setting_key`, `setting_value`, `setting_type`, `description`) VALUES
('trial_duration_days', '7', 'number', 'Trial period duration in days'),
('monthly_price', '50000', 'number', 'Monthly subscription price in IDR'),
('yearly_price', '500000', 'number', 'Yearly subscription price in IDR'),
('max_users_per_server', '100', 'number', 'Maximum users allowed per server'),
('auto_approval', 'false', 'boolean', 'Auto approve new user registrations'),
('maintenance_mode', 'false', 'boolean', 'Enable maintenance mode'),
('app_name', 'Eglobaltech WA-Gateway', 'string', 'Application name'),
('admin_email', 'admin@eglobaltech.id', 'string', 'Admin email for notifications');

-- Show success message
SELECT 'Database imported successfully! 8 tables created.' as status;
SELECT COUNT(*) as total_tables FROM information_schema.tables WHERE table_schema = 'wabot_api';
SHOW TABLES; 