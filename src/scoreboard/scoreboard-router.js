/* eslint-disable eqeqeq */
/* eslint-disable strict, indent */
const express = require('express');
const path = require('path');
const ScoreboardService = require('./scoreboard-service');
const ValidateGameToken = require('../middleware/validateGameToken');

const ScoreboardRouter = express.Router();
const jsonParser = express.json();

ScoreboardRouter
    .route('/')
    .get((req, res, next) => {
        ScoreboardService.getAllScores(req.app.get('db'))
            .then(scoreboard => {
                return res.json(scoreboard);
            })
            .catch(next);
    })
    .post(ValidateGameToken, jsonParser, (req, res, next) => {
        const { nick_name, score } = req.body;
        const newScore = { nick_name, score };

        for (const [key, value] of Object.entries(newScore)) {
            if (value == null) {
                return res.status(400).json({
                    error: { message: `Missing '${key}' in request body` }
                });
            }
        }
        //Insert the score
        ScoreboardService.insertNewScore(req.app.get('db'), newScore)
            .then(newScore => {
                res
                    .status(201)
                    .location(path.posix.join(req.originalUrl, `/${newScore.id}`))
                    .json(newScore);
            })
            .catch(next);
    });
ScoreboardRouter
    .route('/recent')
    .get((req, res, next) => {
        ScoreboardService.getAllRecentScores(req.app.get('db'))
            .then(scoreboard => {
                return res.json(scoreboard);
            })
            .catch(next);
    });

module.exports = ScoreboardRouter;