BEGIN;

TRUNCATE dbss_questions,
dbss_choices,
dbss_users
RESTART IDENTITY CASCADE;

-- INSERT INTO dbss_users (user_name, full_name, nickname, password)
-- VALUES
--   ('dunder', 'Dunder Mifflin', null, '$2a$12$nVvRKRDm3vXy1Y6hUhg2le2MWEMCq25jf3wyX8FYneu98vUVj09Oe'),
--   ('b.deboop', 'Bodeep Deboop', 'Bo', '$2a$12$VtEhA7U6i2f1nglMVIxlwOvcEYIDkQ4Mlvw9bpqADqzI/xq1G3ZtK'),
--   ('c.bloggs', 'Charlie Bloggs', 'Charlie', '$2a$12$DTe3c5t4tqtDA4I8.rS7Euw0pFm6lXhfACNXnZWxS9QHuu3Gf5exm'),
--   ('s.smith', 'Sam Smith', 'Sam', '$2a$12$720/9NruhbdGeIN42wnL5.W8IYfOdVvd26JukXrFxMurDCjZ8kphu'),
--   ('lexlor', 'Alex Taylor', 'Lex', '$2a$12$CPkTXJvAcAwz/whtG/w.GOhlCmWeUq4I/EyTgIMr11fBkjxweCDFq'),
--   ('wippy', 'Ping Won In', 'Ping', '$2a$12$JRM/UNjrJrGlEv3NRk9Z.OH1ozqS51XktBi.huIVYM3TgMopVrkJy');
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