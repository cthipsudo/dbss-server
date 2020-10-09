CREATE TYPE choiceLimit as ENUM ('goblin', 'alien', 'human', 'space_wizard', 'astral_thief', 'cosmic_warrior', 'default');
CREATE TYPE responseAlignment as ENUM ('chaotic', 'neutral', 'lawful');

CREATE TABLE dbss_choices (
  id SERIAL PRIMARY KEY,
  "linkedTo" TEXT NOT NULL,
  "choiceType" choiceLimit,
  choice TEXT NOT NULL,
  alignment responseAlignment NOT NULL,
  score int NOT NULL,
  health_lost int NOT NULL
);

