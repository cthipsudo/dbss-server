/* eslint-disable strict, indent */
const express = require('express');
const CharacterSavesService = require('./character-saves-service');
const { requireAuth } = require('../middleware/jwt-auth');

const CharacterSavesRouter = express.Router();

CharacterSavesRouter
    .route('/')
    .all(requireAuth)
    .get((req, res, next) => {
        CharacterSavesService.getAllCharacterSaves(req.app.get('db'))
            .then(CharacterSaves => {
                //console.log(CharacterSaves);
                res.json(CharacterSaves);
            })
            .catch(next);
    });

module.exports = CharacterSavesRouter;