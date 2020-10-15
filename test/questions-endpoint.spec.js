/* eslint-disable indent */
/* eslint-disable no-undef, quotes, strict */

const { expect } = require('chai');
const knex = require('knex');
const supertest = require('supertest');
const app = require('../src/app');
const helpers = require('./test-helpers');

describe('Questions Endpoints', function () {
    let db;

    const {
        testQuestions,
        testResponses,
        testChoices,
    } = helpers.makeQuestionFixtures();

    before('make knex instance', () => {
        db = knex({
            client: 'pg',
            connection: process.env.TEST_DATABASE_URL,
        });
        app.set('db', db);
    });

    after('disconnect from db', () => db.destroy());

    before('cleanup', () => helpers.cleanTables(db));

    afterEach('cleanup', () => helpers.cleanTables(db));

    describe('GET /api/questions', () => {
        context('Given no questions', () => {
            it('responds with 200 and an empty list', () => {
                return supertest(app)
                    .get(`/api/questions`)
                    .expect(200, []);
            });
        });

        context('Given there are choices in the database', () => {

            beforeEach('insert questions', () =>
                helpers.seedQuestionsTables(
                    db,
                    testQuestions,
                    testChoices,
                    testResponses
                )
            );

            it('responds with 200 and choices', () => {
                return supertest(app)
                    .get(`/api/questions`)
                    .expect(200);
            });
        });
    });

});
