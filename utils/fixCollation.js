const fs = require('fs');
const path = require('path');

/**
 * Fix MySQL collation compatibility for older MySQL versions
 * Converts utf8mb4_0900_ai_ci to utf8mb4_unicode_ci
 */
function fixCollation() {
  console.log('🔧 Fixing MySQL collation compatibility...\n');
  
  const databaseDir = path.join(__dirname, '..', 'database');
  const filesToFix = ['schema.sql', 'migration-fixed.sql'];
  
  filesToFix.forEach(filename => {
    const filePath = path.join(databaseDir, filename);
    const backupPath = path.join(databaseDir, `${filename}.backup`);
    
    if (!fs.existsSync(filePath)) {
      console.log(`⚠️  File ${filename} not found, skipping...`);
      return;
    }
    
    console.log(`📄 Processing ${filename}...`);
    
    try {
      // Read file content
      let content = fs.readFileSync(filePath, 'utf8');
      
      // Create backup
      fs.writeFileSync(backupPath, content);
      console.log(`✅ Backup created: ${filename}.backup`);
      
      // Fix collations
      const fixes = [
        // MySQL 8.0 collations to MySQL 5.7 compatible
        { from: /utf8mb4_0900_ai_ci/g, to: 'utf8mb4_unicode_ci' },
        { from: /utf8_0900_ai_ci/g, to: 'utf8_unicode_ci' },
        
        // Fix charset declarations
        { from: /DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci/g, to: 'DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci' },
        { from: /CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci/g, to: 'CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci' },
        
        // Fix table engine if needed
        { from: /ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;/g, to: 'ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;' }
      ];
      
      let changeCount = 0;
      fixes.forEach(fix => {
        const matches = content.match(fix.from);
        if (matches) {
          content = content.replace(fix.from, fix.to);
          changeCount += matches.length;
        }
      });
      
      // Write fixed content
      fs.writeFileSync(filePath, content);
      
      if (changeCount > 0) {
        console.log(`✅ Fixed ${changeCount} collation issues in ${filename}`);
      } else {
        console.log(`ℹ️  No collation issues found in ${filename}`);
      }
      
    } catch (error) {
      console.error(`❌ Error processing ${filename}:`, error.message);
    }
  });
  
  console.log('\n🎉 Collation fix completed!');
  console.log('\n📝 Files are now compatible with:');
  console.log('   - MySQL 5.7+');
  console.log('   - MariaDB 10.2+');
  console.log('   - Most VPS MySQL installations');
  
  console.log('\n🔄 To restore original files:');
  console.log('   - Rename .backup files back to .sql');
}

// Run if called directly
if (require.main === module) {
  fixCollation();
}

module.exports = fixCollation; 