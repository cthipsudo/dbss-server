/* eslint-disable strict, indent */
const express = require('express');
const ChoicesService = require('./choices-service');
const { requireAuth } = require('../middleware/jwt-auth');

const ChoicesRouter = express.Router();

ChoicesRouter
    .route('/')
    .get((req, res, next) => {
        ChoicesService.getAllChoices(req.app.get('db'))
            .then(Choices => {
                //console.log(Choices);
                res.json(Choices);
            })
            .catch(next);
    });

module.exports = ChoicesRouter;