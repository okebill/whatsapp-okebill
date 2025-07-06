const { exec } = require('child_process');
const fs = require('fs');
const path = require('path');
const mysql = require('mysql2/promise');
const dbConfig = require('../config/database');
const os = require('os');

class GitHubUpdater {
  constructor() {
    this.backupDir = path.join(__dirname, '..', 'backups');
    this.logFile = path.join(__dirname, '..', 'logs', 'update.log');
    this.isWindows = os.platform() === 'win32';
  }

  // Log function
  log(message) {
    const timestamp = new Date().toISOString();
    const logMessage = `[${timestamp}] ${message}\n`;
    
    console.log(message);
    
    // Append to log file
    try {
      if (!fs.existsSync(path.dirname(this.logFile))) {
        fs.mkdirSync(path.dirname(this.logFile), { recursive: true });
      }
      fs.appendFileSync(this.logFile, logMessage);
    } catch (error) {
      console.error('Error writing to log file:', error);
    }
  }

  // Execute shell command
  async executeCommand(command, description) {
    return new Promise((resolve, reject) => {
      this.log(`Executing: ${description}`);
      this.log(`Command: ${command}`);
      
      exec(command, (error, stdout, stderr) => {
        if (error) {
          this.log(`Error: ${error.message}`);
          reject(error);
          return;
        }
        
        if (stderr) {
          this.log(`Warning: ${stderr}`);
        }
        
        if (stdout) {
          this.log(`Output: ${stdout}`);
        }
        
        resolve(stdout);
      });
    });
  }

  // Get copy command based on OS
  getCopyCommand(source, dest, isDirectory = false) {
    if (this.isWindows) {
      return isDirectory ? `xcopy "${source}" "${dest}" /E /I /Y` : `copy "${source}" "${dest}"`;
    } else {
      return isDirectory ? `cp -r "${source}" "${dest}"` : `cp "${source}" "${dest}"`;
    }
  }

  // Create backup
  async createBackup() {
    try {
      this.log('🔄 Creating backup...');
      
      if (!fs.existsSync(this.backupDir)) {
        fs.mkdirSync(this.backupDir, { recursive: true });
      }
      
      const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
      const backupName = `backup_${timestamp}`;
      const backupPath = path.join(this.backupDir, backupName);
      
      // Backup important files
      const filesToBackup = [
        { file: 'config/database.js', isDir: false },
        { file: '.env', isDir: false },
        { file: 'sessions/', isDir: true },
        { file: 'logs/', isDir: true },
        { file: 'package.json', isDir: false }
      ];
      
      fs.mkdirSync(backupPath, { recursive: true });
      
      for (const item of filesToBackup) {
        const sourcePath = path.join(__dirname, '..', item.file);
        const destPath = path.join(backupPath, item.file);
        
        if (fs.existsSync(sourcePath)) {
          if (item.isDir) {
            const command = this.getCopyCommand(sourcePath, destPath, true);
            try {
              await this.executeCommand(command, `Backup directory ${item.file}`);
            } catch (error) {
              this.log(`Warning: Failed to backup ${item.file}: ${error.message}`);
            }
          } else {
            const destDir = path.dirname(destPath);
            if (!fs.existsSync(destDir)) {
              fs.mkdirSync(destDir, { recursive: true });
            }
            fs.copyFileSync(sourcePath, destPath);
          }
          this.log(`✅ Backed up: ${item.file}`);
        }
      }
      
      this.log(`✅ Backup created: ${backupPath}`);
      return backupPath;
      
    } catch (error) {
      this.log(`❌ Backup failed: ${error.message}`);
      throw error;
    }
  }

  // Check for updates
  async checkForUpdates() {
    try {
      this.log('🔍 Checking for updates...');
      
      // Fetch latest changes
      await this.executeCommand('git fetch origin', 'Fetch latest changes');
      
      // Check if there are updates
      const result = await this.executeCommand(
        'git log HEAD..origin/main --oneline',
        'Check for new commits'
      );
      
      if (result.trim() === '') {
        this.log('✅ No updates available');
        return false;
      }
      
      this.log('📋 Available updates:');
      this.log(result);
      return true;
      
    } catch (error) {
      this.log(`❌ Error checking updates: ${error.message}`);
      throw error;
    }
  }

  // Backup database
  async backupDatabase() {
    try {
      this.log('💾 Creating database backup...');
      
      const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
      const backupFile = path.join(this.backupDir, `database_backup_${timestamp}.sql`);
      
      // Create mysqldump command
      const command = `mysqldump -h ${dbConfig.host} -u ${dbConfig.user} -p${dbConfig.password} ${dbConfig.database} > "${backupFile}"`;
      
      await this.executeCommand(command, 'Backup database');
      
      this.log(`✅ Database backup created: ${backupFile}`);
      return backupFile;
      
    } catch (error) {
      this.log(`❌ Database backup failed: ${error.message}`);
      throw error;
    }
  }

  // Update application
  async updateApplication() {
    try {
      this.log('🚀 Starting application update...');
      
      // 1. Create backup
      const backupPath = await this.createBackup();
      
      // 2. Backup database
      await this.backupDatabase();
      
      // 3. Stop application (if using PM2)
      try {
        await this.executeCommand('pm2 stop all', 'Stop PM2 processes');
      } catch (error) {
        this.log('Warning: PM2 not found or no processes running');
      }
      
      // 4. Pull latest changes
      await this.executeCommand('git pull origin main', 'Pull latest changes');
      
      // 5. Install/update dependencies
      await this.executeCommand('npm install', 'Install/update dependencies');
      
      // 6. Run database migrations if any
      try {
        await this.executeCommand('npm run test-db', 'Test database connection');
      } catch (error) {
        this.log('Warning: Database test failed, but continuing...');
      }
      
      // 7. Restart application
      try {
        await this.executeCommand('pm2 restart all', 'Restart PM2 processes');
      } catch (error) {
        this.log('Warning: PM2 restart failed, try manual restart');
      }
      
      this.log('🎉 Update completed successfully!');
      this.log(`📁 Backup location: ${backupPath}`);
      
      return {
        success: true,
        backupPath: backupPath,
        message: 'Update completed successfully'
      };
      
    } catch (error) {
      this.log(`❌ Update failed: ${error.message}`);
      throw error;
    }
  }

  // Rollback to previous version
  async rollback(backupPath) {
    try {
      this.log(`🔄 Rolling back to backup: ${backupPath}`);
      
      if (!fs.existsSync(backupPath)) {
        throw new Error('Backup path not found');
      }
      
      // Stop application
      try {
        await this.executeCommand('pm2 stop all', 'Stop PM2 processes');
      } catch (error) {
        this.log('Warning: PM2 not found');
      }
      
      // Restore files
      const filesToRestore = fs.readdirSync(backupPath);
      
      for (const file of filesToRestore) {
        const sourcePath = path.join(backupPath, file);
        const destPath = path.join(__dirname, '..', file);
        
        if (fs.statSync(sourcePath).isDirectory()) {
          const command = this.getCopyCommand(sourcePath, destPath, true);
          try {
            await this.executeCommand(command, `Restore directory ${file}`);
          } catch (error) {
            this.log(`Warning: Failed to restore ${file}: ${error.message}`);
          }
        } else {
          fs.copyFileSync(sourcePath, destPath);
        }
        
        this.log(`✅ Restored: ${file}`);
      }
      
      // Restart application
      try {
        await this.executeCommand('pm2 restart all', 'Restart PM2 processes');
      } catch (error) {
        this.log('Warning: PM2 restart failed, try manual restart');
      }
      
      this.log('✅ Rollback completed');
      
    } catch (error) {
      this.log(`❌ Rollback failed: ${error.message}`);
      throw error;
    }
  }

  // Get update status
  async getStatus() {
    try {
      const hasUpdates = await this.checkForUpdates();
      
      // Get current version info
      const currentCommit = await this.executeCommand('git rev-parse HEAD', 'Get current commit');
      const currentBranch = await this.executeCommand('git branch --show-current', 'Get current branch');
      const lastUpdate = await this.executeCommand('git log -1 --format="%ci"', 'Get last update time');
      
      return {
        hasUpdates,
        currentCommit: currentCommit.trim().substring(0, 8),
        currentBranch: currentBranch.trim(),
        lastUpdate: lastUpdate.trim(),
        updateAvailable: hasUpdates
      };
      
    } catch (error) {
      this.log(`❌ Error getting status: ${error.message}`);
      throw error;
    }
  }
}

// CLI interface
async function main() {
  const updater = new GitHubUpdater();
  const command = process.argv[2];
  
  try {
    switch (command) {
      case 'check':
        console.log('🔍 Checking for updates...');
        const status = await updater.getStatus();
        console.log('📋 Status:', JSON.stringify(status, null, 2));
        break;
        
      case 'update':
        console.log('🚀 Starting update...');
        const result = await updater.updateApplication();
        console.log('✅ Update result:', result);
        break;
        
      case 'rollback':
        const backupPath = process.argv[3];
        if (!backupPath) {
          console.log('❌ Please provide backup path');
          console.log('Usage: node utils/updateFromGitHub.js rollback <backup_path>');
          return;
        }
        await updater.rollback(backupPath);
        break;
        
      case 'backup':
        console.log('💾 Creating backup...');
        const backup = await updater.createBackup();
        console.log('✅ Backup created:', backup);
        break;
        
      default:
        console.log('📖 Usage:');
        console.log('  node utils/updateFromGitHub.js check    - Check for updates');
        console.log('  node utils/updateFromGitHub.js update   - Update application');
        console.log('  node utils/updateFromGitHub.js backup   - Create backup only');
        console.log('  node utils/updateFromGitHub.js rollback <path> - Rollback to backup');
    }
    
  } catch (error) {
    console.error('❌ Error:', error.message);
    process.exit(1);
  }
}

// Export for use in other modules
module.exports = GitHubUpdater;

// Run CLI if called directly
if (require.main === module) {
  main();
} 