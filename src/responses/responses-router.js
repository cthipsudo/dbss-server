/* eslint-disable strict, indent */
const express = require('express');
const ResponsesService = require('./responses-service');
const { requireAuth } = require('../middleware/jwt-auth');

const ResponsesRouter = express.Router();

ResponsesRouter
    .route('/')
    .get((req, res, next) => {
        ResponsesService.getAllResponses(req.app.get('db'))
            .then(Responses => {
                res.json(Responses);
            })
            .catch(next);
    });

module.exports = ResponsesRouter;