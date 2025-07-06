const mysql = require('mysql2/promise');

// Database configuration
const dbConfig = {
    host: process.env.DB_HOST || 'localhost',
    user: process.env.DB_USER || 'root',
    password: process.env.DB_PASS || '',
    database: process.env.DB_NAME || 'wabot_api'
};

async function testDatabaseImport() {
    console.log('🔍 Testing Database Import...\n');
    
    try {
        // Create connection
        const connection = await mysql.createConnection(dbConfig);
        console.log('✅ Database connection successful');
        
        // Test 1: Check if all tables exist
        console.log('\n📊 Checking database tables...');
        const [tables] = await connection.execute('SHOW TABLES');
        
        const expectedTables = [
            'users',
            'message_stats', 
            'user_contacts',
            'user_groups',
            'user_connections',
            'user_payments',
            'user_api_usage',
            'system_settings'
        ];
        
        const tableNames = tables.map(row => Object.values(row)[0]);
        
        for (const table of expectedTables) {
            if (tableNames.includes(table)) {
                console.log(`✅ Table '${table}' exists`);
            } else {
                console.log(`❌ Table '${table}' missing`);
            }
        }
        
        // Test 2: Check admin user
        console.log('\n👤 Checking admin user...');
        const [adminUsers] = await connection.execute(
            'SELECT username, role, is_active FROM users WHERE role = "admin"'
        );
        
        if (adminUsers.length > 0) {
            console.log('✅ Admin user found:');
            adminUsers.forEach(user => {
                console.log(`   - Username: ${user.username}`);
                console.log(`   - Role: ${user.role}`);
                console.log(`   - Active: ${user.is_active ? 'Yes' : 'No'}`);
            });
        } else {
            console.log('❌ Admin user not found');
        }
        
        // Test 3: Check system settings
        console.log('\n⚙️ Checking system settings...');
        const [settings] = await connection.execute(
            'SELECT setting_key, setting_value FROM system_settings'
        );
        
        if (settings.length > 0) {
            console.log(`✅ System settings found (${settings.length} items):`);
            settings.forEach(setting => {
                console.log(`   - ${setting.setting_key}: ${setting.setting_value}`);
            });
        } else {
            console.log('❌ System settings not found');
        }
        
        // Test 4: Check table structures
        console.log('\n🏗️ Checking table structures...');
        
        // Check users table structure
        const [usersColumns] = await connection.execute('DESCRIBE users');
        const requiredColumns = ['id', 'username', 'password', 'api_key', 'whatsapp_number', 'is_active', 'payment_status'];
        
        let usersTableOK = true;
        for (const col of requiredColumns) {
            const exists = usersColumns.some(column => column.Field === col);
            if (!exists) {
                console.log(`❌ Users table missing column: ${col}`);
                usersTableOK = false;
            }
        }
        
        if (usersTableOK) {
            console.log('✅ Users table structure is correct');
        }
        
        // Test 5: Check foreign key constraints
        console.log('\n🔗 Checking foreign key constraints...');
        const [constraints] = await connection.execute(`
            SELECT 
                TABLE_NAME,
                COLUMN_NAME,
                CONSTRAINT_NAME,
                REFERENCED_TABLE_NAME,
                REFERENCED_COLUMN_NAME
            FROM information_schema.KEY_COLUMN_USAGE 
            WHERE REFERENCED_TABLE_SCHEMA = '${dbConfig.database}'
            AND REFERENCED_TABLE_NAME IS NOT NULL
        `);
        
        if (constraints.length > 0) {
            console.log(`✅ Foreign key constraints found (${constraints.length} constraints):`);
            constraints.forEach(constraint => {
                console.log(`   - ${constraint.TABLE_NAME}.${constraint.COLUMN_NAME} -> ${constraint.REFERENCED_TABLE_NAME}.${constraint.REFERENCED_COLUMN_NAME}`);
            });
        } else {
            console.log('⚠️ No foreign key constraints found');
        }
        
        // Test 6: Test database operations
        console.log('\n🧪 Testing database operations...');
        
        // Test insert/delete operation
        try {
            await connection.execute(`
                INSERT INTO users (username, password, role, is_active) 
                VALUES ('test_user', 'test_pass', 'user', 0)
            `);
            console.log('✅ Insert operation successful');
            
            await connection.execute('DELETE FROM users WHERE username = "test_user"');
            console.log('✅ Delete operation successful');
        } catch (error) {
            console.log('❌ Database operations failed:', error.message);
        }
        
        // Final summary
        console.log('\n📋 Import Summary:');
        console.log(`✅ Database: ${dbConfig.database}`);
        console.log(`✅ Tables: ${tableNames.length}/8`);
        console.log(`✅ Admin users: ${adminUsers.length}`);
        console.log(`✅ System settings: ${settings.length}`);
        console.log(`✅ Foreign keys: ${constraints.length}`);
        
        await connection.end();
        console.log('\n🎉 Database import test completed successfully!');
        
        return true;
        
    } catch (error) {
        console.error('❌ Database test failed:', error.message);
        console.error('\n🔧 Troubleshooting tips:');
        console.error('1. Check database credentials in config/database.js');
        console.error('2. Ensure MySQL/MariaDB is running');
        console.error('3. Verify database "wabot_api" exists');
        console.error('4. Run: npm run setup-database');
        return false;
    }
}

// Export for use in other modules
module.exports = { testDatabaseImport };

// Run test if called directly
if (require.main === module) {
    testDatabaseImport().then(success => {
        process.exit(success ? 0 : 1);
    });
} 