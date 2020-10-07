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
    dbss_users (user_name, password, date_created)
VALUES
  ('dunder', 'apple'),
  ('park', 'banana'),
  ('recs', 'pear'),
  ('community', 'orange'),
  ('brooklyn', 'watermelon'),
  ('ninenine', 'peach');

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