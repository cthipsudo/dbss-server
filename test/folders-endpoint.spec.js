/* eslint-disable strict */
/* eslint-disable quotes */
const { expect } = require("chai");
const knex = require("knex");
const supertest = require("supertest");
const app = require("../src/app");
const { makeFoldersArray } = require("./folders.fixtures");

describe.only("Folders Endpoint", function () {
  let db;

  before("make knex instance", () => {
    db = knex({
      client: "pg",
      connection: process.env.TEST_DB_URL,
    });
    app.set("db", db);
  });

  after("disconnect from db", () => db.destroy());

  before("cleanup", () => db.raw("TRUNCATE folders RESTART IDENTITY CASCADE"));

  afterEach("cleanup", () =>
    db.raw("TRUNCATE folders RESTART IDENTITY CASCADE")
  );

  describe.skip(`GET /folders`, () => {
    context("Given there are folders in the database", () => {
      const testFolders = makeFoldersArray();

      beforeEach("insert folders", () => {
        return db.into("folders").insert(testFolders);
      });

      it(`grabs all folders`, () => {
        return supertest(app)
          .get("/folders")
          .set("Authorization", `Bearer ${process.env.API_TOKEN}`)
          .expect(200);
      });
    });
  });
});
