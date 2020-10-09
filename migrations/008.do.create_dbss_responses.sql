

CREATE TABLE dbss_responses (
  id SERIAL PRIMARY KEY,
  "linkedTo" TEXT REFERENCES dbss_questions(id),
  alignment responseAlignment NOT NULL,
  response TEXT NOT NULL,
  game_ending BOOLEAN NOT NULL
);

