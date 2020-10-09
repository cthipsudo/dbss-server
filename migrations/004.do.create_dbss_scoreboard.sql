CREATE TABLE dbss_scoreboard (
  id SERIAL PRIMARY KEY,
  nick_name TEXT NOT NULL,
  score INT NOT NULL,
  date_created TIMESTAMPTZ NOT NULL DEFAULT now()
);

