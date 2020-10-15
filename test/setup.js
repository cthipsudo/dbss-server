// eslint-disable-next-line strict
const {expect} = require('chai');
const supertest = require('supertest');

require('dotenv').config();

process.env.TEST_DATABASE_URL = process.env.TEST_DATABASE_URL
  || 'postgresql://ryu:apple@localhost/dbss-test';

global.expect = expect;
global.supertest = supertest;