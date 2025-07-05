require('dotenv').config();

const config = {
  host: process.env.DB_HOST || 'localhost',
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_NAME || 'wabot_db',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
};

module.exports = config; 