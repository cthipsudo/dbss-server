CREATE TABLE dbss_character_saves (
  id INTEGER PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
  user_id INTEGER REFERENCES dbss_users(id),
  slot_num INTEGER NOT NULL,
  char_name TEXT NOT NULL,
  char_class INTEGER REFERENCES dbss_classes(id),
  char_race INTEGER REFERENCES dbss_races(id)
);
