/* eslint-disable strict, indent */
const xss = require('xss');

const CharacterSavesService = {
    getAllCharacterSaves(db) {
        return db
            .from('dbss_character_saves')
            .select('*');

    },

    insertCharSave(db, newChar) {
        return db
            .insert(newChar)
            .into('dbss_character_saves')
            .returning('*')
            .then(rows => {
                return rows[0];
            });
    },

    getById(db, id) {
        return db
            .from('dbss_character_saves')
            .select('*')
            .where('.id', id)
            .first();
    },

    getUsersSaves(db, userId) {
        return db
            .from('dbss_character_saves AS dcs')
            .select(
                'dcs.user_id',
                'dcs.slot_num',
                'dcs.char_name',
                'dc.class_name',
                'dr.race_name'
            )
            .join('dbss_classes AS dc', 'dcs.char_class', '=', 'dc.id')
            .join('dbss_races AS dr', 'dcs.char_race', '=', 'dr.id')
            .where('dcs.user_id', userId);
    },
    checkASave(db, pid, slotnum) {
        return db('dbss_character_saves')
            .where({
                user_id: pid,
                slot_num: slotnum
            })
            .first();
    },
    deleteCharSave(db, pid, slotnum) {
        return db('dbss_character_saves')
            .where({
                user_id: pid,
                slot_num: slotnum
            })
            .delete();
    },
    updateCharSave(knex, id, newArticleFields) {
        return knex('dbss_character_saves')
            .where({ id })
            .update(newArticleFields);
    },

    serializeCharacter(char) {
        const { user_id, slot_num, char_name, char_class, char_race } = char;
        return { 
            user_id, 
            slot_num, 
            char_name: xss(char_name), 
            char_class, 
            char_race 
        };
    },
};

module.exports = CharacterSavesService;
