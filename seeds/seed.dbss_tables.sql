BEGIN;

TRUNCATE dbss_users,
dbss_character_saves,
dbss_classes,
dbss_races,
dbss_scoreboard,
dbss_questions,
dbss_choices,
dbss_responses
RESTART IDENTITY CASCADE;

INSERT INTO 
    dbss_users (user_name, password)
VALUES
  ('dunder', '$2a$12$7/g92wWGobDhaKoFBCKALuVPm9bG7Sz89ZlSUOD./7AcquqTgJsCK'),
  ('park', '$2a$12$hDy90VKLeKG30CpTLqRffOUiydRzdt29CEuSzytO4l8ODfe7Zutvu'),
  ('recs', '$2a$12$UDSjEUvCXW.SdMBL1wx2Du10RAcBiZUZBFL7hmdfEUyzYPcxrNd5a'),
  ('midslotgone', '$2a$12$szaYO.Vn2sIXzuZSSqJ0q.QU.Iii5r5lSYkEeD2QhK1ngKulJPA1y'),
  ('brooklyn', '$2a$12$WuHLfqdQJ.61Ay1Q4yqdrOLaDHDU7l/pDjBby3q.kBVH1bpKSMGsa'),
  ('ninenine', '$2a$12$784WvwVBHrb39GMyJxM.Zebg1i8.tmrvUBZ.EALszMrsDFEs0L5EG');

--   ('dunder', 'apple'),
--   ('park', 'banana'),
--   ('recs', 'pear'),
--   ('midslotgone', 'orange'),
--   ('brooklyn', 'watermelon'),
--   ('ninenine', 'peach');

INSERT INTO
    dbss_classes (class_name)
VALUES
    ('space_wizard'),
    ('astral_thief'),
    ('cosmic_warrior');

INSERT INTO 
    dbss_races (race_name)
VALUES
    ('human'),
    ('alien'),
    ('goblin');

INSERT INTO 
    dbss_character_saves (user_id, slot_num, char_name, char_class, char_race)
VALUES
    (1, 3, 'Bob', 3, 1),
    (1, 2, 'Oregano', 2, 2),
    (2, 1, 'Benji', 1, 1),
    (2, 2, 'Spore', 3, 2),
    (2, 3, 'Apple', 2, 3),
    (3, 1, 'poison', 2, 1),
    (3, 2, 'Pear', 1, 3),
    (3, 3, 'Cryie', 2, 3),
    (1, 1, 'Sappy', 1, 3),
    (4, 1, 'Slot One', 3, 3),
    (4, 3, 'Slot Three', 2, 1),
    (5, 2, 'Twoie', 2, 2),
    (6, 3, 'Tree Guy', 1, 1);

INSERT INTO
    dbss_questions (id, "linkedTo", question)
VALUES
    ('a1','a', 'AI: Hello Captain, I am your Buddy On Board Briefing Yokemate, B.O.B.B.Y. for short.\n\nThis is the first question to get you familiar with the game you''re playing, tell me Captain.\n\n\nWho are you?'),
    ('b1','b', 'Example question b1'),
    ('b2','b', 'Example question b2'),
    ('c1','c', 'Example question c1');

INSERT INTO
    dbss_choices (
        "linkedTo", "choiceType", score, health_lost, alignment,
        choice
    )
VALUES
    (
        'a1','goblin', 50, 0, 'chaotic',
        '*recites your name in gobish*'
    ),
    (
        'a1', 'alien', 50, 0, 'neutral',
        '*Gurgles* I''m an alien!'
        
    ),
    (
        'a1', 'human', 50, 0, 'lawful',
        'Hello There! Just an average human.'
    ),
    (
        'a1', 'space_wizard', 50, 0, 'lawful',
        '*bows* An elegant wizard at your service.'
    ),
    (
        'a1', 'astral_thief', 50, 0, 'neutral',
        '*scoffs* Ha, Thief Extraordinaire...'
        
    ),
    (
        'a1', 'cosmic_warrior', 50, 0, 'chaotic',
        'GWARH! STRONG WARRIOR AM I!'
    ),
    (
        'a1', 'default', 25, 0, 'neutral',
        'Hey there, just a pilot.'
    ),
    (
        'a1', 'default', 25, 0, 'neutral',
        'That''s none of your business who I am to you.'
    ),
    (
        'b1', 'goblin', 25, 0, 'chaotic',
        'Goblin Response'
    ),

    (
        'b1', 'alien', 25, 0, 'neutral',
        'Alien Response'
    ),

    (
        'b1', 'human', 25, 0, 'lawful',
        'Human Response'
    ),
    (
        'b1', 'space_wizard', 25, 0, 'lawful',
        'Wizard Response'
    ),

    (
        'b1', 'astral_thief', 25, 0, 'neutral',
        'Thief Response'
    ),

    (
        'b1', 'cosmic_warrior', 25, 0, 'chaotic',
        'warrior response'
    ),

    (
        'b1', 'default', 25, 0, 'neutral',
        'default response 3'
    ),

    (
        'b1', 'default', 25, 0, 'lawful',
        'default response 4'
    ),

    (
        'b2', 'goblin', 25, 0, 'chaotic',
        'Goblin Response'
    ),

    (
        'b2', 'alien', 25, 0, 'neutral',
        'Alien Response'
    ),

    (
        'b2', 'human', 25, 0, 'lawful',
        'Human Response'
    ),
    (
        'b2', 'space_wizard', 25, 0, 'lawful',
        'Wizard Response'
    ),

    (
        'b2', 'astral_thief', 25, 0, 'neutral',
        'Thief Response'
    ),

    (
        'b2', 'cosmic_warrior', 25, 0, 'chaotic',
        'warrior response'
    ),

    (
        'b2', 'default', 25, 0, 'neutral',
        'default response 3'
    ),

    (
        'b2', 'default', 25, 0, 'lawful',
        'default response 4'
    ),

    (
        'c1', 'goblin', 25, 0, 'chaotic',
        'Goblin Response'
    ),

    (
        'c1', 'alien', 25, 0, 'neutral',
        'Alien Response'
    ),

    (
        'c1', 'human', 25, 0, 'lawful',
        'Human Response'
    ),
    (
        'c1', 'space_wizard', 25, 0, 'lawful',
        'Wizard Response'
    ),

    (
        'c1', 'astral_thief', 25, 0, 'neutral',
        'Thief Response'
    ),

    (
        'c1', 'cosmic_warrior', 25, 0, 'chaotic',
        'warrior response'
    ),

    (
        'c1', 'default', 25, 0, 'neutral',
        'default response 3'
    ),

    (
        'c1', 'default', 25, 0, 'lawful',
        'default response 4'
    );

INSERT INTO
    dbss_responses ("linkedTo", alignment, response, game_ending)
VALUES
    ('a1', 'chaotic', 'Interesting..uh...response Captain. Good to meet you, looks like you''re ready to start.\n\nPlease don''t break anything.', false),
    ('a1', 'neutral', 'Nice to meet you Captain, you seem capable of handling a ship.\n\nLet''s start once you''re ready.', false),
    ('a1', 'lawful', 'A pleasure to meet you Captain. Refreshing to meet someone with your caliber.\n\nI''m ready to begin this journey with you.', false),
    ('b1', 'chaotic', 'b1 chaotic response here', false),
    ('b1', 'neutral', 'b1 neutral response here', false),
    ('b1', 'lawful', 'b1 lawful response here', false),
    ('b2', 'chaotic', 'b2 chaotic response here', false),
    ('b2', 'neutral', 'b2 neutral response here', false),
    ('b2', 'lawful', 'b2 lawful response here', false),
    ('c1', 'chaotic', 'c1 chaotic response here', false),
    ('c1', 'neutral', 'c1 neutral response here', false),
    ('c1', 'lawful', 'c1 lawful response here', false);

COMMIT;

