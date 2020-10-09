

CREATE TABLE dbss_responses (
  id SERIAL PRIMARY KEY,
  "linkedTo" TEXT NOT NULL,
  alignment responseAlignment NOT NULL,
  response TEXT NOT NULL,
  game_ending BOOLEAN NOT NULL
);

