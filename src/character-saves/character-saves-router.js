/* eslint-disable strict, indent */
const path = require('path');
const express = require('express');
const CharacterSavesService = require('./character-saves-service');
const { requireAuth } = require('../middleware/jwt-auth');

const CharacterSavesRouter = express.Router();
const jsonParser = express.json();

CharacterSavesRouter
    .route('/:playerid')
    .all(requireAuth)
    .get((req, res, next) => {
        const playerId = req.params.playerid;

        CharacterSavesService.getUsersSaves(req.app.get('db'), playerId)
            .then(CharacterSaves => {
                res.json(CharacterSaves);
            })
            .catch(next);
    });
CharacterSavesRouter
    .route('/:playerid/:slotnum')
    .all(requireAuth)
    .post(jsonParser, (req, res, next) => {
        const slot_num = req.params.slotnum.split('-')[1];
        const user_id = req.params.playerid;
        const { char_name, char_class, char_race } = req.body;
        const newCharSave = { user_id, slot_num, char_name, char_class, char_race };

        for (const [key, value] of Object.entries(newCharSave)) {
            if (value == null) {
                return res.status(400).json({
                    error: { message: `Missing '${key}' in request body` }
                });
            }
        }
        //Check if theres a save already
        CharacterSavesService.checkASave(req.app.get('db'), user_id, slot_num)
            .then(save => {
                if (save) return res.status(400).json({ error: 'Existing save found', });
                return CharacterSavesService.insertCharSave(req.app.get('db'), newCharSave)
                    .then(charSave => {
                        res
                            .status(201)
                            .location(path.posix.join(req.originalUrl, `/${charSave.id}`))
                            .json(charSave);
                    })
                    .catch(next);
            });
    })
    .patch(jsonParser,(req, res, next) => {
        const slot_num = req.params.slotnum.split('-')[1];
        const user_id = req.params.playerid;
        const { char_name, char_class, char_race } = req.body;
        const newCharSave = { user_id, slot_num, char_name, char_class, char_race };
        
        for (const [key, value] of Object.entries(newCharSave)) {
            if (value == null) {
                return res.status(400).json({
                    error: { message: `Missing '${key}' in request body` }
                });
            }
        }

        CharacterSavesService.checkASave(req.app.get('db'), user_id, slot_num)
            .then(save => {
                if(!save) return res.status(400).json({ error: `No existing save here, can't update`, });
                const cleanChar = CharacterSavesService.serializeCharacter(newCharSave);
                console.log(save);
                return CharacterSavesService.updateCharSave(req.app.get('db'), save.id, cleanChar)
                    .then( charSave =>{
                        res
                            .status(200)
                            .location(path.posix.join(req.originalUrl, `/${charSave.id}`))
                            .json(charSave);
                    })
                    .catch(next);
            } );
    })
    .delete((req, res, next) => {
        const { playerid, slotnum } = req.params;
        //Check if that save exists
        CharacterSavesService.checkASave(req.app.get('db'), playerid, slotnum)
            .then(save => {
                if (!save) return res.status(400).json({ error: 'No existing save', });
                return CharacterSavesService.deleteCharSave(req.app.get('db'), playerid, slotnum)
                    .then(() => {
                        res.status(204).end();
                    })
                    .catch(next);
            });
    });
module.exports = CharacterSavesRouter;