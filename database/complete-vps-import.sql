-- =============================================
-- COMPLETE VPS DATABASE IMPORT SCRIPT
-- WhatsApp Multi-Tenant SaaS Platform
-- Compatible: MySQL 5.7+ / MariaDB 10.2+
-- =============================================

-- Set proper SQL mode and charset
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS `wabot_api` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `wabot_api`;

-- =============================================
-- PART 1: BASIC SCHEMA SETUP
-- =============================================

-- Create users table
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_key` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_device_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp_device_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_connected` timestamp NULL DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `api_key` (`api_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create message_stats table
CREATE TABLE IF NOT EXISTS `message_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sender_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_type` enum('personal','group') COLLATE utf8mb4_unicode_ci DEFAULT 'personal',
  `message_length` int(11) DEFAULT '0',
  `success` tinyint(1) DEFAULT '1',
  `error_message` text COLLATE utf8mb4_unicode_ci,
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_sender_number` (`sender_number`),
  KEY `idx_sent_at` (`sent_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- PART 2: MULTI-TENANT EXTENSIONS
-- =============================================

-- Add multi-tenant columns to users table
ALTER TABLE `users` 
ADD COLUMN IF NOT EXISTS `whatsapp_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `is_active` tinyint(1) DEFAULT '0',
ADD COLUMN IF NOT EXISTS `approved_by` int(11) DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `approved_at` timestamp NULL DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `subscription_type` enum('free','monthly','yearly') COLLATE utf8mb4_unicode_ci DEFAULT 'free',
ADD COLUMN IF NOT EXISTS `expired_date` date DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN IF NOT EXISTS `last_payment_date` date DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `payment_status` enum('active','expired','suspended','trial') COLLATE utf8mb4_unicode_ci DEFAULT 'trial',
ADD COLUMN IF NOT EXISTS `trial_ends_at` date DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
ADD COLUMN IF NOT EXISTS `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL;

-- Add unique constraint for whatsapp_number
ALTER TABLE `users` ADD UNIQUE KEY IF NOT EXISTS `whatsapp_number` (`whatsapp_number`);

-- Create user_contacts table
CREATE TABLE IF NOT EXISTS `user_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `contact_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_avatar` text COLLATE utf8mb4_unicode_ci,
  `is_business` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_contact` (`user_id`,`contact_phone`),
  KEY `idx_user_contacts_user_id` (`user_id`),
  CONSTRAINT `user_contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create user_groups table
CREATE TABLE IF NOT EXISTS `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_description` text COLLATE utf8mb4_unicode_ci,
  `participants_count` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_group` (`user_id`,`group_id`),
  KEY `idx_user_groups_user_id` (`user_id`),
  CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create user_connections table
CREATE TABLE IF NOT EXISTS `user_connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `whatsapp_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_status` enum('connected','disconnected','scanning','connecting') COLLATE utf8mb4_unicode_ci DEFAULT 'disconnected',
  `last_connected` timestamp NULL DEFAULT NULL,
  `last_disconnected` timestamp NULL DEFAULT NULL,
  `session_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qr_code` text COLLATE utf8mb4_unicode_ci,
  `device_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_user_connection` (`user_id`),
  KEY `idx_user_connections_status` (`connection_status`),
  CONSTRAINT `user_connections_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create user_payments table
CREATE TABLE IF NOT EXISTS `user_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT 'IDR',
  `payment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expired_date` date NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('pending','paid','failed','refunded') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_transaction` (`transaction_id`),
  KEY `idx_user_payments_user_id` (`user_id`),
  KEY `idx_user_payments_status` (`status`),
  CONSTRAINT `user_payments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create user_api_usage table
CREATE TABLE IF NOT EXISTS `user_api_usage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `endpoint` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `request_data` text COLLATE utf8mb4_unicode_ci,
  `response_status` int(11) DEFAULT NULL,
  `response_time_ms` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_user_date` (`user_id`,`created_at`),
  KEY `idx_endpoint` (`endpoint`),
  CONSTRAINT `user_api_usage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Create system_settings table
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `setting_value` text COLLATE utf8mb4_unicode_ci,
  `setting_type` enum('string','number','boolean','json') COLLATE utf8mb4_unicode_ci DEFAULT 'string',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `setting_key` (`setting_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- =============================================
-- PART 3: INDEXES FOR PERFORMANCE
-- =============================================

-- Add performance indexes
CREATE INDEX IF NOT EXISTS `idx_users_active` ON `users`(`is_active`);
CREATE INDEX IF NOT EXISTS `idx_users_payment_status` ON `users`(`payment_status`);
CREATE INDEX IF NOT EXISTS `idx_users_expired_date` ON `users`(`expired_date`);
CREATE INDEX IF NOT EXISTS `idx_message_stats_user_id` ON `message_stats`(`user_id`);

-- =============================================
-- PART 4: DEFAULT DATA
-- =============================================

-- Insert default admin user
INSERT INTO `users` (`username`, `password`, `api_key`, `role`, `is_active`, `payment_status`) VALUES 
('admin', '$2a$10$XFE/UQoGYOUzFrN8.ZKnZu4RDvz.FY4P1FopYHkUKHF.U.S.i9arm', SUBSTRING(MD5(RAND()) FROM 1 FOR 32), 'admin', 1, 'active')
ON DUPLICATE KEY UPDATE `id`=`id`;

-- Insert default system settings
INSERT INTO `system_settings` (`setting_key`, `setting_value`, `setting_type`, `description`) VALUES
('trial_duration_days', '7', 'number', 'Trial period duration in days'),
('monthly_price', '50000', 'number', 'Monthly subscription price in IDR'),
('yearly_price', '500000', 'number', 'Yearly subscription price in IDR'),
('max_users_per_server', '100', 'number', 'Maximum users allowed per server'),
('auto_approval', 'false', 'boolean', 'Auto approve new user registrations'),
('maintenance_mode', 'false', 'boolean', 'Enable maintenance mode'),
('app_name', 'Eglobaltech WA-Gateway', 'string', 'Application name'),
('admin_email', 'admin@eglobaltech.id', 'string', 'Admin email for notifications')
ON DUPLICATE KEY UPDATE `setting_value`=VALUES(`setting_value`);

-- Set trial period for existing users
UPDATE `users` SET 
  `trial_ends_at` = DATE_ADD(CURDATE(), INTERVAL 7 DAY),
  `payment_status` = 'trial'
WHERE `trial_ends_at` IS NULL AND `role` != 'admin';

-- =============================================
-- PART 5: FOREIGN KEY CONSTRAINTS
-- =============================================

-- Add foreign key for message_stats if not exists
ALTER TABLE `message_stats` 
ADD CONSTRAINT IF NOT EXISTS `message_stats_ibfk_1` 
FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

-- =============================================
-- PART 6: VERIFICATION
-- =============================================

-- Verify database structure
SELECT 'Database import completed successfully!' as status;
SELECT COUNT(*) as total_tables FROM information_schema.tables WHERE table_schema = 'wabot_api';
SELECT COUNT(*) as admin_users FROM users WHERE role = 'admin';
SELECT COUNT(*) as system_settings FROM system_settings;

-- Show all tables
SHOW TABLES;

-- Commit transaction
COMMIT; 