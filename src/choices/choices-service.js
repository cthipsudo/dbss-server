/* eslint-disable strict, indent */

const ChoicesService = {
  getAllChoices(db) {
    return db
      .from('dbss_choices')
      .select('*');
  },

  getById(db, id) {
    return db
      .from('dbss_choices')
      .select('*')
      .where('choice.id', id)
      .first();
  },
};

module.exports = ChoicesService;

