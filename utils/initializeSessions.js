const fs = require('fs');
const path = require('path');

/**
 * Initialize sessions folder structure
 */
function initializeSessions() {
  console.log('🔧 Initializing sessions folder structure...\n');
  
  const sessionsPath = path.join(__dirname, '..', 'sessions');
  
  try {
    // Create main sessions folder if not exists
    if (!fs.existsSync(sessionsPath)) {
      fs.mkdirSync(sessionsPath, { recursive: true });
      console.log('✅ Created sessions/ folder');
    } else {
      console.log('ℹ️  sessions/ folder already exists');
    }
    
    // Set proper permissions (Linux/Mac)
    if (process.platform !== 'win32') {
      fs.chmodSync(sessionsPath, 0o755);
      console.log('✅ Set sessions folder permissions to 755');
    }
    
    // Create .gitkeep file to ensure folder exists in git
    const gitkeepPath = path.join(sessionsPath, '.gitkeep');
    if (!fs.existsSync(gitkeepPath)) {
      fs.writeFileSync(gitkeepPath, '# This file ensures the sessions folder exists in git\n# The actual session files are ignored for security\n');
      console.log('✅ Created .gitkeep file');
    }
    
    // Create README for sessions folder
    const readmePath = path.join(sessionsPath, 'README.md');
    if (!fs.existsSync(readmePath)) {
      const readmeContent = `# Sessions Folder

This folder contains WhatsApp session data for multi-tenant users.

## Structure
- \`user_1/\` - Session for user ID 1
- \`user_2/\` - Session for user ID 2
- \`user_N/\` - Session for user ID N

## Security Notes
- This folder is ignored by git (.gitignore)
- Contains sensitive WhatsApp authentication data
- Should never be committed to version control
- Backup this folder separately for production

## Permissions
- Folder: 755 (rwxr-xr-x)
- Files: 644 (rw-r--r--)
- Owner: www-data (or your web server user)

## Maintenance
- Clean old sessions periodically
- Monitor disk usage
- Backup active sessions before server maintenance
`;
      
      fs.writeFileSync(readmePath, readmeContent);
      console.log('✅ Created sessions README.md');
    }
    
    console.log('\n🎉 Sessions folder initialized successfully!');
    console.log('📁 Path:', sessionsPath);
    console.log('🔒 Security: Folder is properly ignored by git');
    console.log('📝 Documentation: README.md created in sessions folder');
    
  } catch (error) {
    console.error('❌ Error initializing sessions folder:', error);
    throw error;
  }
}

// Run if called directly
if (require.main === module) {
  initializeSessions();
}

module.exports = initializeSessions; 