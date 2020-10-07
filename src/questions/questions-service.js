/* eslint-disable strict, indent */

const QuestionsService = {
  getAllQuestions(db) {
    return db
      .from('dbss_questions')
      .select('*');
  },

  getById(db, id) {
    return db
      .from('dbss_questions')
      .select('*')
      .where('question.id', id)
      .first();
  },
};

module.exports = QuestionsService;

