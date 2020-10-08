BEGIN;

TRUNCATE dbss_users,
dbss_character_saves,
dbss_classes,
dbss_races,
dbss_scoreboard,
dbss_questions,
dbss_choices
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
    dbss_questions ("linkedTo", question)
VALUES
    ('a', '(Question A) FIXED first question: Who are you?');

INSERT INTO
    dbss_choices (
        "linkedTo",
        "choiceType",
        choice,
        score
    )
VALUES
    (
        1,
        'goblin',
        'Hi I''m a goblin',
        50
    ),
    (
        1,
        'alien',
        'Hi I''m a alien',
        50
    ),
    (
        1,
        'human',
        'Hi I''m a human',
        50
    ),
    (
        1,
        'space_wizard',
        'An elegant wizard at your service',
        50
    ),
    (
        1,
        'astral_thief',
        'Thief extraordinaire',
        50
    ),
    (
        1,
        'cosmic_warrior',
        'Gwarh! Strong Warrior I am!',
        50
    ),
    (
        1,
        'default',
        'Default Choice 3 from question A',
        25
    ),
    (
        1,
        'default',
        'Default Choice 4 from question A',
        25
    );

COMMIT;