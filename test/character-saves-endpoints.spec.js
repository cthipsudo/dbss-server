/* eslint-disable no-undef, quotes, strict */

const { expect } = require('chai');
const knex = require('knex');
const supertest = require('supertest');
const app = require('../src/app');
const helpers = require('./test-helpers');

describe('Character Saves Endpoints', function () {
  let db;

  const {
    testUsers,
    testClasses,
    testRaces,
    testCharSaves,
  } = helpers.makeCharacterSaveFixtures();

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

  describe('GET /api/char-save/:playerid', () => {
    context('Given no saves', () => {
      beforeEach(() =>
        helpers.seedUsers(db, testUsers)
      );

      const testUser = testUsers[2];

      it('responds with 200 and an empty list', () => {
        return supertest(app)
          .get(`/api/char-save/${testUser.id}`)
          .set('Authorization', helpers.makeAuthHeader(testUser))
          .expect(200, []);
      });
    });

    context('Given there are character saves in the database', () => {
      beforeEach('insert characterSaves', () =>
        helpers.seedChararacterSavesTables(
          db,
          testUsers,
          testClasses,
          testRaces,
          testCharSaves
        )
      );

      it('responds with 200 and the users charsaves', () => {
        const testUser = testUsers[0];
        const expectedUserSaves = helpers.makeExpectedCharacterSaves(
          testUser,
          testClasses,
          testRaces,
          testCharSaves
        );

        return supertest(app)
          .get(`/api/char-save/${testUser.id}`)
          .set('Authorization', helpers.makeAuthHeader(testUser))
          .expect(200, expectedUserSaves);
      });
    });
  });

  describe(`POST /api/char-save/:user-id/:slot-num`, () => {
    beforeEach('insert characterSaves', () =>
      helpers.seedChararacterSavesTables(
        db,
        testUsers,
        testClasses,
        testRaces,
        testCharSaves
      )
    );

    it(`creates an char save, responding with 201 and the new charsave`, () => {
      const testUser = testUsers[2];
      const slotNum = 1;
      const newCharSave = {
        char_name: "Millie",
        char_class: 2,
        char_race: 2,
      };
      //console.log(testCharSaves);
      return supertest(app)
        .post(`/api/char-save/${testUser.id}/slot-${slotNum}`)
        .set('Authorization', helpers.makeAuthHeader(testUser))
        .send(newCharSave)
        .expect(201)
        .expect(res => {
          //console.log(res.body);
          expect(res.body).to.have.property('id');
          expect(res.body.user_id).to.eql(testUser.id);
          expect(res.body.slot_num).to.eql(slotNum);
          expect(res.body.char_name).to.eql(newCharSave.char_name);
          expect(res.body.char_class).to.eql(newCharSave.char_class);
          expect(res.body.char_race).to.eql(newCharSave.char_race);
        });
    });
  });

  describe(`PATCH /api/char-save/:user-id/:slot-num`, () => {
    beforeEach('insert characterSaves', () =>
      helpers.seedChararacterSavesTables(
        db,
        testUsers,
        testClasses,
        testRaces,
        testCharSaves
      )
    );

    it(`edits a char save, responding with 200 'char updated'`, () => {
      const testUser = testUsers[0];
      const slotNum = 1;
      const newCharSave = {
        char_name: "Millie",
        char_class: 2,
        char_race: 2,
      };

      //console.log(testCharSaves);
      return supertest(app)
        .patch(`/api/char-save/${testUser.id}/slot-${slotNum}`)
        .set('Authorization', helpers.makeAuthHeader(testUser))
        .send(newCharSave)
        .expect(200)
        .expect(res =>{
          //console.log(res);
          expect(res.body.message).to.eql('char updated');
        });
    });
  });

  describe(`DELETE /api/char-save/:user-id/:slot-num`, () => {
    beforeEach('insert characterSaves', () =>
      helpers.seedChararacterSavesTables(
        db,
        testUsers,
        testClasses,
        testRaces,
        testCharSaves
      )
    );

    it(`delets a char save, responding with 204`, () => {
      const testUser = testUsers[0];
      const slotNum = 1;

      //console.log(testCharSaves);
      return supertest(app)
        .delete(`/api/char-save/${testUser.id}/${slotNum}`)
        .set('Authorization', helpers.makeAuthHeader(testUser))
        .expect(204);
    });
  });
});
