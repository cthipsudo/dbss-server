CREATE TYPE choiceLimit as ENUM ('goblin', 'alien', 'human', 'space_wizard', 'astral_thief', 'cosmic_warrior', 'default');

CREATE TABLE dbss_choices (
  id SERIAL PRIMARY KEY,
  "linkedTo" INTEGER REFERENCES dbss_questions(id),
  "choiceType" choiceLimit,
  choice TEXT NOT NULL,
  score int
);

