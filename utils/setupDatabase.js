const mysql = require('mysql2/promise');
const fs = require('fs');
const path = require('path');
const dbConfig = require('../config/database');

/**
 * Automated Database Setup Script
 * Sets up complete multi-tenant WhatsApp SaaS database
 */
async function setupDatabase() {
  console.log('🚀 Starting automated database setup...\n');
  
  let connection;
  
  try {
    // Connect to MySQL (without database)
    const connectionConfig = { ...dbConfig };
    delete connectionConfig.database;
    
    connection = await mysql.createConnection(connectionConfig);
    console.log('✅ Connected to MySQL server');
    
    // Create database if not exists
    await connection.query(`CREATE DATABASE IF NOT EXISTS ${dbConfig.database}`);
    console.log(`✅ Database '${dbConfig.database}' created/verified`);
    
    // Use the database
    await connection.query(`USE ${dbConfig.database}`);
    console.log(`✅ Using database '${dbConfig.database}'`);
    
    // Read and execute schema.sql
    const schemaPath = path.join(__dirname, '..', 'database', 'schema.sql');
    if (fs.existsSync(schemaPath)) {
      console.log('\n📄 Importing basic schema...');
      const schemaSQL = fs.readFileSync(schemaPath, 'utf8');
      
      // Split SQL by semicolon and execute each statement
      const statements = schemaSQL.split(';').filter(stmt => stmt.trim().length > 0);
      
      for (const statement of statements) {
        if (statement.trim()) {
          try {
            await connection.query(statement);
          } catch (error) {
            // Ignore errors for statements that might already exist
            if (!error.message.includes('already exists') && 
                !error.message.includes('Duplicate')) {
              console.warn(`⚠️  Warning executing statement: ${error.message}`);
            }
          }
        }
      }
      console.log('✅ Basic schema imported successfully');
    }
    
    // Read and execute migration-fixed.sql
    const migrationPath = path.join(__dirname, '..', 'database', 'migration-fixed.sql');
    if (fs.existsSync(migrationPath)) {
      console.log('\n📄 Importing multi-tenant migration...');
      const migrationSQL = fs.readFileSync(migrationPath, 'utf8');
      
      // Split SQL by semicolon and execute each statement
      const statements = migrationSQL.split(';').filter(stmt => stmt.trim().length > 0);
      
      for (const statement of statements) {
        if (statement.trim()) {
          try {
            await connection.query(statement);
          } catch (error) {
            // Ignore errors for statements that might already exist
            if (!error.message.includes('already exists') && 
                !error.message.includes('Duplicate') &&
                !error.message.includes('duplicate column name')) {
              console.warn(`⚠️  Warning executing statement: ${error.message}`);
            }
          }
        }
      }
      console.log('✅ Multi-tenant migration imported successfully');
    }
    
    // Verify tables
    console.log('\n🔍 Verifying database structure...');
    const [tables] = await connection.query('SHOW TABLES');
    console.log(`✅ Found ${tables.length} tables:`);
    tables.forEach(table => {
      const tableName = Object.values(table)[0];
      console.log(`   - ${tableName}`);
    });
    
    // Check admin user
    console.log('\n👤 Checking admin user...');
    const [adminUsers] = await connection.query(
      "SELECT id, username, role FROM users WHERE role = 'admin'"
    );
    
    if (adminUsers.length > 0) {
      console.log('✅ Admin user found:');
      adminUsers.forEach(user => {
        console.log(`   - ID: ${user.id}, Username: ${user.username}`);
      });
    } else {
      console.log('⚠️  No admin user found, creating default admin...');
      
      // Create default admin user
      const bcrypt = require('bcryptjs');
      const hashedPassword = await bcrypt.hash('admin123', 10);
      const apiKey = require('crypto').randomBytes(32).toString('hex');
      
      await connection.execute(
        `INSERT INTO users (username, password, api_key, role, is_active, payment_status) 
         VALUES (?, ?, ?, 'admin', 1, 'active')`,
        ['admin', hashedPassword, apiKey]
      );
      
      console.log('✅ Default admin user created');
      console.log('   - Username: admin');
      console.log('   - Password: admin123');
      console.log(`   - API Key: ${apiKey}`);
    }
    
    // Check system settings
    console.log('\n⚙️  Checking system settings...');
    const [settings] = await connection.query('SELECT COUNT(*) as count FROM system_settings');
    console.log(`✅ Found ${settings[0].count} system settings`);
    
    // Test message_stats table
    console.log('\n📊 Testing message_stats table...');
    try {
      await connection.query(
        'SELECT COUNT(*) as count FROM message_stats LIMIT 1'
      );
      console.log('✅ message_stats table is accessible');
    } catch (error) {
      console.error('❌ message_stats table error:', error.message);
    }
    
    await connection.end();
    
    console.log('\n🎉 Database setup completed successfully!');
    console.log('\n📝 Next steps:');
    console.log('1. Update your .env file with database credentials');
    console.log('2. Run: npm start');
    console.log('3. Login with username: admin, password: admin123');
    console.log('4. Access: http://localhost:1992/auth/login');
    
  } catch (error) {
    console.error('❌ Database setup failed:', error);
    console.error('Error details:', error.message);
    console.error('Stack trace:', error.stack);
    
    if (connection) {
      await connection.end();
    }
    
    console.log('\n🔧 Troubleshooting:');
    console.log('1. Check MySQL service is running');
    console.log('2. Verify database credentials in config/database.js');
    console.log('3. Check MySQL error logs');
    console.log('4. Ensure MySQL user has CREATE DATABASE permissions');
    
    process.exit(1);
  }
}

// Run if called directly
if (require.main === module) {
  setupDatabase();
}

module.exports = setupDatabase; 