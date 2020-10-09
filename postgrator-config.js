/* eslint-disable strict */
require('dotenv').config();

module.exports = {
  'migrationDirectory': 'migrations',
  'driver': 'pg',
  'connectionString': (process.env.NODE_ENV === 'test') ? process.env.TEST_DB_URL : (process.env.NODE_ENV === 'deploy') ? process.env.DEPLOY_DB_URL : process.env.DB_URL,
};