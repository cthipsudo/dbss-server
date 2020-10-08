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
CharacterSavesRouter
    .route('/:playerid/:slotnum')
    .delete((req, res, next) => {
        const { playerid, slotnum } = req.params;
        //Check if that save exists
        // CharacterSavesService.checkASave(req.app.get('db'), playerid, slotnum)
        // .then(res => {
        //     console.log(res);
        // });

        CharacterSavesService.deleteCharSave(req.app.get('db'), playerid, slotnum)
            .then(() => {
                res.status(204).end();
            })
            .catch(next);
        //res.json({message: "trying to delete a char", playerId: playerid, slotnum: slotnum});
    });
module.exports = CharacterSavesRouter;