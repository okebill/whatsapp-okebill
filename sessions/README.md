# Sessions Folder

This folder contains WhatsApp session data for multi-tenant users.

## Structure
- `user_1/` - Session for user ID 1
- `user_2/` - Session for user ID 2
- `user_N/` - Session for user ID N

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
