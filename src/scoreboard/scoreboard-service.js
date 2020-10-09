/* eslint-disable strict, indent */

const ScoreboardService = {
    getAllScores(db) {
        return db
            .from('dbss_scoreboard')
            .select('*')
            .orderBy('score', 'desc')
            .limit(10);

    },

    getAllRecentScores(db) {
        return db
            .from('dbss_scoreboard')
            .select('*')
            .orderBy('date_created', 'desc')
            .limit(10);
    },

    insertNewScore(db, newScore) {
        return db
            .insert(newScore)
            .into('dbss_scoreboard')
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
};

module.exports = ScoreboardService;
