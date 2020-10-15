/* eslint-disable indent */
/* eslint-disable no-undef, quotes, strict */

const { expect } = require('chai');
const knex = require('knex');
const supertest = require('supertest');
const app = require('../src/app');
const helpers = require('./test-helpers');

describe('Scoreboard Endpoints', function () {
    let db;

    const {
        testScores
    } = helpers.makeScoreFixtures();

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

    describe('GET /api/scoreboard', () => {
        context('Given no scoreboard', () => {
            it('responds with 200 and an empty list', () => {
                return supertest(app)
                    .get(`/api/scoreboard`)
                    .expect(200, []);
            });
        });

        context('Given there are scores in the database', () => {
            beforeEach('insert scores', () => {
                helpers.seedScoreTables(db, testScores);
            });
            it('responds with 200 and scores', () => {
                return supertest(app)
                    .get(`/api/scoreboard`)
                    .expect(200);
            });
        });
    });

    describe(`POST /api/scoreboard`, () => {
        beforeEach('insert scores', () =>
            helpers.seedScoreTables(
                db, testScores
            )
        );

        it(`creates an char save, responding with 201 and the new charsave`, () => {
            const newScore = {
                nick_name: "der",
                score: 8334
            };
            //console.log(testCharSaves);
            return supertest(app)
                .post(`/api/scoreboard`)
                .set("Authorization", `Bearer ${process.env.API_TOKEN}`)
                .send(newScore)
                .expect(201)
                .expect(res => {
                    //console.log(res.body);
                    expect(res.body).to.have.property('id');
                    expect(res.body.nick_name).to.eql(newScore.nick_name);
                    expect(res.body.score).to.eql(newScore.score);
                });
        });
    });
});
