/* eslint-disable strict */
const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const helmet = require('helmet');
const { NODE_ENV } = require('./config');
const choicesRouter = require('./choices/choices-router');
const questionsRouter = require('./questions/questions-router');
const characterSavesRouter = require('./character-saves/character-saves-router');
const responsesRouter = require('./responses/responses-router');
const authRouter = require('./auth/auth-router');
const scorboardRouter = require('./scoreboard/scoreboard-router');
const app = express();

const morganOption = (NODE_ENV === 'production')
  ? 'tiny'
  : 'common';

app.use(morgan(morganOption));
app.use(helmet());
app.use(cors());

app.use('/api/choices', choicesRouter);
app.use('/api/questions', questionsRouter);
app.use('/api/char-save', characterSavesRouter);
app.use('/api/auth', authRouter);
app.use('/api/responses', responsesRouter);
app.use('/api/scoreboard', scorboardRouter);

app.use(function errorHandler(error, req, res, next) {
  let response;
  if (NODE_ENV === 'production') {
    response = { error: { message: 'server error hello there! :(' }, error };
  } else {
    console.error(error);
    response = { message: error.message, error };
  }
  res.status(500).json(response);
});

app.get('/', (req, res) => {
  res.send('Welcome to the world!');
});
module.exports = app;