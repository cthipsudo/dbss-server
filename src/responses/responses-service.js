/* eslint-disable strict, indent */

const ResponsesService = {
  getAllResponses(db) {
    return db
      .from('dbss_responses')
      .select('*');
  },

  getById(db, id) {
    return db
      .from('dbss_responses')
      .select('*')
      .where('question.id', id)
      .first();
  },
};

module.exports = ResponsesService;

