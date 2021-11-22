/* eslint-disable strict */

require('dotenv').config();

const knex = require('knex');
const app = require('./app');
const { PORT, DATABASE_URL, rejectUnauthorized } = require('./config');

const db = knex({
  client: 'pg',
  connection: {
    connectionString: DATABASE_URL,
    ssl: rejectUnauthorized
  }
});

app.set('db', db);

app.listen(PORT, () => {
});