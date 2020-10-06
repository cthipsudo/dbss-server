/* eslint-disable strict, indent */

const ChoicesService = {
  getAllChoices(db) {
    return db
      .from('dbss_choices')
      .select('linkedTo', 'choiceType', 'choice', 'score');
  },

  getById(db, id) {
    return ChoicesService.getAllArticles(db)
      .where('choice.id', id)
      .first();
  },
};

module.exports = ChoicesService;
