/* eslint-disable strict, indent */

const CharacterSavesService = {
    getAllCharacterSaves(db) {
        return db
            .from('dbss_character_saves')
            .select('*');

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
            .join('dbss_races AS dr', 'dcs.char_race',  '=', 'dr.id')
            .where('dcs.user_id', userId);
    },
};

module.exports = CharacterSavesService;
