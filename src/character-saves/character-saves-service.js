/* eslint-disable strict, indent */

const CharacterSavesService = {
    getAllCharacterSaves(db) {
        return db
            .from('dbss_character_saves')
            .select('*');

    },

    insertCharacterSave(db, newChar) {
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
    }
};

module.exports = CharacterSavesService;
