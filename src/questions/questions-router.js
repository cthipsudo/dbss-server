/* eslint-disable strict, indent */
const express = require('express');
const QuestionsService = require('./questions-service');
const { requireAuth } = require('../middleware/jwt-auth');

const QuestionsRouter = express.Router();

QuestionsRouter
    .route('/')
    .get((req, res, next) => {
        QuestionsService.getAllQuestions(req.app.get('db'))
            .then(Questions => {
                res.json(Questions);
            })
            .catch(next);
    });

module.exports = QuestionsRouter;