const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken')

function makeUsersArray() {
  return [
    {
      id: 1,
      user_name: 'dunder',
      password: 'apple',
      date_created: new Date('2029-01-22T16:28:32.615Z'),
    },
    {
      id: 2,
      user_name: 'park',
      password: 'orange',
      date_created: new Date('2029-01-22T16:28:32.615Z'),
    },
    {
      id: 3,
      user_name: 'recs',
      password: 'pear',
      date_created: new Date('2029-01-22T16:28:32.615Z'),
    },
  ]
}

function makeClassesArray() {
  return [
    {
      id: 1,
      class_name: "space_wizard"
    },
    {
      id: 2,
      class_name: "astral_thief"
    },
    {
      id: 3,
      class_name: "space_wizard"
    },
  ]
}

function makeRacesArray() {
  return [
    {
      id: 1,
      race_name: "human"
    },
    {
      id: 2,
      race_name: "alien"
    },
    {
      id: 3,
      race_name: "goblin"
    },
  ]
}

function makeCharacterSavesArray(testUsers, testClasses, testRaces) {
  return [
    {
      id: 1,
      user_id: testUsers[0].id,
      slot_num: 2,
      char_name: "Oregano",
      char_class: testClasses[1].id,
      char_race: testRaces[1].id
    },
    {
      id: 2,
      user_id: testUsers[0].id,
      slot_num: 1,
      char_name: "Sappy",
      char_class: testClasses[0].id,
      char_race: testRaces[2].id
    },
    {
      id: 3,
      user_id: testUsers[0].id,
      slot_num: 3,
      char_name: "Bob",
      char_class: testClasses[2].id,
      char_race: testRaces[2].id
    },
    {
      id: 4,
      user_id: testUsers[1].id,
      slot_num: 2,
      char_name: "test user 2",
      char_class: testClasses[1].id,
      char_race: testRaces[1].id
    },
  ]
}

function makeChoicesArray(questions) {
  return [
    {
      id: '1',
      linkedTo: questions[0].id,
      choiceType: 'goblin',
      choice: 'test choice a1 goblin',
      alignment: 'chaotic',
      score: 2500,
      health_lost: 0
    },
    {
      id: '2',
      linkedTo: questions[0].id,
      choiceType: 'alien',
      choice: 'test choice a1 alien',
      alignment: 'neutral',
      score: 2500,
      health_lost: 0
    },
    {
      id: '3',
      linkedTo: questions[0].id,
      choiceType: 'human',
      choice: 'test choice a1 human',
      alignment: 'lawful',
      score: 2500,
      health_lost: 0
    },
    {
      id: '4',
      linkedTo: questions[0].id,
      choiceType: 'space_wizard',
      choice: 'test choice a1 space_wizard',
      alignment: 'lawful',
      score: 2500,
      health_lost: 0
    },
    {
      id: '5',
      linkedTo: questions[0].id,
      choiceType: 'astral_thief',
      choice: 'test choice a1 astral_thief',
      alignment: 'neutral',
      score: 2500,
      health_lost: 0
    },
    {
      id: '6',
      linkedTo: questions[0].id,
      choiceType: 'cosmic_warrior',
      choice: 'test choice a1 cosmic_warrior',
      alignment: 'chaotic',
      score: 2500,
      health_lost: 0
    },
    {
      id: '7',
      linkedTo: questions[0].id,
      choiceType: 'default',
      choice: 'test choice a1 default 1',
      alignment: 'lawful',
      score: 2500,
      health_lost: 0
    },
    {
      id: '8',
      linkedTo: questions[0].id,
      choiceType: 'default',
      choice: 'test choice a1 default 2',
      alignment: 'neutral',
      score: 2500,
      health_lost: 0
    },
  ]
}

function makeQuestionsArray() {
  return [
    {
      id: 1,
      linkedTo: 'a',
      question: 'This is test question 1'
    },
    {
      id: 2,
      linkedTo: 'b',
      question: 'This is test question 2'
    },
    {
      id: 3,
      linkedTo: 'b',
      question: 'This is test question 3'
    },
  ]
}

function makeResponsesArray(questions) {
  return [
    {
      id: 1,
      linkedTo: questions[0].id,
      alignment: 'chaotic',
      response: "test response chaotic for a1",
      game_ending: false,
    },
    {
      id: 2,
      linkedTo: questions[0].id,
      alignment: 'neutral',
      response: "test response neutral for a1",
      game_ending: false,
    },
    {
      id: 3,
      linkedTo: questions[0].id,
      alignment: 'lawful',
      response: "test response lawful for a1",
      game_ending: true,
    },
    {
      id: 4,
      linkedTo: questions[0].id,
      alignment: 'chaotic',
      response: "test response chaotic for b1",
      game_ending: false,
    },
    {
      id: 5,
      linkedTo: questions[1].id,
      alignment: 'neutral',
      response: "test response neutral for b1",
      game_ending: false,
    },
    {
      id: 6,
      linkedTo: questions[1].id,
      alignment: 'lawful',
      response: "test response lawful for b1",
      game_ending: false,
    },
    {
      id: 7,
      linkedTo: questions[2].id,
      alignment: 'chaotic',
      response: "test response chaotic for b2",
      game_ending: false,
    },
    {
      id: 8,
      linkedTo: questions[2].id,
      alignment: 'neutral',
      response: "test response neutral for b2",
      game_ending: false,
    },
    {
      id: 9,
      linkedTo: questions[2].id,
      alignment: 'lawful',
      response: "test response lawful for b2",
      game_ending: false,
    },
  ]
}

function makeScoreboardArray() {
  return [
    {
      id: 1,
      nick_name: "ABC",
      score: 123
    },
    {
      id: 2,
      nick_name: "DEF",
      score: 1234
    },
    {
      id: 3,
      nick_name: "GHI",
      score: 12356
    },
  ]
}


function makeExpectedCharacterSaves(user, classes, races, charSaves) {

  const characterSaves = charSaves
    .filter(save => save.user_id === user.id)
    .map(save => ({
      user_id: save.user_id,
      char_name: save.char_name,
      class_name: classes[save.char_class - 1].class_name,
      race_name: races[save.char_race - 1].race_name,
      slot_num: save.slot_num
    }))

  return characterSaves;
}

function makeCharacterSaveFixtures() {
  const testUsers = makeUsersArray();
  const testClasses = makeClassesArray();
  const testRaces = makeRacesArray();
  const testCharSaves = makeCharacterSavesArray(testUsers, testClasses, testRaces);

  return { testUsers, testClasses, testRaces, testCharSaves }
}

function makeQuestionFixtures() {
  const testQuestions = makeQuestionsArray();
  const testChoices = makeChoicesArray(testQuestions);
  const testResponses = makeResponsesArray(testQuestions);

  return { testQuestions, testChoices, testResponses }
}

function makeScoreFixtures() {
  const testScores = makeScoreboardArray();

  return { testScores }
}



function cleanTables(db) {
  return db.transaction(trx =>
    trx.raw(
      `TRUNCATE
        dbss_users,
        dbss_classes,
        dbss_races,
        dbss_character_saves,
        dbss_questions,
        dbss_choices,
        dbss_responses,
        dbss_scoreboard
      `
    )
      .then(() =>
        Promise.all([
          trx.raw(`ALTER SEQUENCE dbss_users_id_seq minvalue 0 START WITH 1`),
          trx.raw(`ALTER SEQUENCE dbss_classes_id_seq minvalue 0 START WITH 1`),
          trx.raw(`ALTER SEQUENCE dbss_races_id_seq minvalue 0 START WITH 1`),
          trx.raw(`ALTER SEQUENCE dbss_character_saves_id_seq minvalue 0 START WITH 1`),
          trx.raw(`ALTER SEQUENCE dbss_choices_id_seq minvalue 0 START WITH 1`),
          trx.raw(`ALTER SEQUENCE dbss_responses_id_seq minvalue 0 START WITH 1`),
          trx.raw(`ALTER SEQUENCE dbss_scoreboard_id_seq minvalue 0 START WITH 1`),
          trx.raw(`SELECT setval('dbss_users_id_seq', 0)`),
          trx.raw(`SELECT setval('dbss_classes_id_seq', 0)`),
          trx.raw(`SELECT setval('dbss_races_id_seq', 0)`),
          trx.raw(`SELECT setval('dbss_character_saves_id_seq', 0)`),
          trx.raw(`SELECT setval('dbss_choices_id_seq', 0)`),
          trx.raw(`SELECT setval('dbss_responses_id_seq', 0)`),
          trx.raw(`SELECT setval('dbss_scoreboard_id_seq', 0)`),
        ])
      )
  )
}
function seedUsers(db, users) {
  const preppedUsers = users.map(user => ({
    ...user,
    password: bcrypt.hashSync(user.password, 1)
  }))
  return db.into('dbss_users').insert(preppedUsers)
    .then(() =>
      // update the auto sequence to stay in sync
      db.raw(
        `SELECT setval('dbss_users_id_seq', ?)`,
        [users[users.length - 1].id],
      )
    )
}

function seedChararacterSavesTables(db, users, classes, races, characterSaves) {
  // use a transaction to group the queries and auto rollback on any failure
  return db.transaction(async trx => {
    await trx.into('dbss_users').insert(users)
    await trx.into('dbss_classes').insert(classes)
    await trx.into('dbss_races').insert(races)
    await trx.into('dbss_character_saves').insert(characterSaves)
    // update the auto sequence to match the forced id values
    await Promise.all([
      trx.raw(
        `SELECT setval('dbss_users_id_seq', ?)`,
        [users[users.length - 1].id],
      ),
      trx.raw(
        `SELECT setval('dbss_classes_id_seq', ?)`,
        [classes[classes.length - 1].id],
      ),
      trx.raw(
        `SELECT setval('dbss_races_id_seq', ?)`,
        [races[races.length - 1].id],
      ),
      trx.raw(
        `SELECT setval('dbss_character_saves_id_seq', ?)`,
        [characterSaves[characterSaves.length - 1].id],
      ),
    ])
  })
}

function seedQuestionsTables(db, questions, choices, responses) {
  return db.transaction(async trx => {
    await trx.into('dbss_questions').insert(questions)
    await trx.into('dbss_choices').insert(choices)
    await trx.into('dbss_responses').insert(responses)
  })
}

function seedScoreTables(db, scores) {
  return db.transaction(async trx => {
    await trx.into('dbss_scoreboard').insert(scores)
    await trx.raw(
      `SELECT setval('dbss_scoreboard_id_seq', ?)`,
      [scores[scores.length - 1].id],
    )
  });
}

function makeAuthHeader(user, secret = process.env.JWT_SECRET) {
  const token = jwt.sign({ user_id: user.id }, secret, {
    subject: user.user_name,
    algorithm: 'HS256'
  })
  return `Bearer ${token}`
}

module.exports = {
  makeUsersArray,
  makeCharacterSaveFixtures,
  makeAuthHeader,
  makeExpectedCharacterSaves,
  makeQuestionFixtures,
  makeScoreFixtures,
  cleanTables,
  seedUsers,
  seedChararacterSavesTables,
  seedQuestionsTables,
  seedScoreTables,
}
