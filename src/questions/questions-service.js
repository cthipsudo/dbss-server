/* eslint-disable strict, indent */

const QuestionsService = {
  getAllQuestions(db) {
    return db
      .from('dbss_questions')
      .select('*');
  },

  getById(db, id) {
    return QuestionsService.getAllArticles(db)
      .where('choice.id', id)
      .first();
  },
};

module.exports = QuestionsService;

