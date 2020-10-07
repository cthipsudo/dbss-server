/* eslint-disable strict, indent */
const express = require('express');
const CharacterSavesService = require('./character-saves-service');
const { requireAuth } = require('../middleware/jwt-auth');

const CharacterSavesRouter = express.Router();

CharacterSavesRouter
    .route('/:playerid')
    .all(requireAuth)
    .get((req, res, next) => {
        const playerId = req.params.playerid;

        CharacterSavesService.getUsersSaves(req.app.get('db'), playerId)
            .then(CharacterSaves => {
                //console.log(CharacterSaves);
                res.json(CharacterSaves);
            })
            .catch(next);
    });

module.exports = CharacterSavesRouter;