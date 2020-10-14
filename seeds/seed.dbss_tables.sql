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
    ('a1','a', 'Hello {name}, I am your Buddy On Board Briefing Yokemate,\nB.O.B.B.Y. for short.\n\nWelcome to Drifting Between Silence and Stardust, a bite-sized interactive choose-your-own-adventure-game.\nLet''s get you up to speed with how the game works.\nTell me Captain, who are you?'),
    ('b1','b', '“Captain! Thank goodness, the Manuels fell off the shelf\nand landed on your head\nknocking you out!\nI knew it was risky to travel through an asteroid belt, but you just had to convince me…\n\nMassive rupture inside the engine bay. By my calculations, this ship will explode in 10 mins. Captain, what are you going to do?”'),
    ('b2','b', 'As you walk down the hallway an anxiety driven thought comes across your mind.\n”Can I really save this ship in 5 minutes?”\n\n You stop in place to consider your options.'),
    ('b3','b', 'Upon reaching the engine room, you are greeted by a vicious blast of smoke to the face as the ship''s engines struggle to stay alive. \n\n”Captain! What took you so long to get to the engine room?\nThere’s less than a minute left until complete reactor meltdown!”\nYou approach the engine and observe its moving parts.\nAs far as you could tell, the values are clogged, the cryosphere is melting, and the pistons are blocked.'),
    ('b4','b', '“Hello Captain, let me explain.”\nB.O.B.B.Y. begins explaining to you about the situation with the Manuels.\nThe Manuels begin to applaud and cheer in gratitude for saving them.\n”I’ve been meaning to tell you about the stowaways Captain but I can assure you.\nThey are not the cause of the damage to the engine. I mean look at em!”\nYou stare into the eyes of the Manuels and ponder your options.'),
    ('c1','c', '“Captain, good morning!\nIncoming message from the Local Space Pirates.“\n “Hello Captain, I am Space Captain Barlock and I need to break into SAU.\n The local maximum security complex. I have a very important man locked up that I need out.\n You’re probably wondering, why me? One, your expendable and two, I can blow you up if you refuse my contract. ”\n\n You contemplate your choices.'),
    ('c2','c', '“Captain, can you hear me! You’ve just entered the garbage chute!”\nAfter splashing into the crud and muck,\nthe chute behind you closes and the walls start caving in.\n…\n(Doesn’t this situation feel familiar?)\nAfter a quick observation you see a panel at the far end of the room\nand quickly rush to it.\nThe panel consists of an array of buttons.\nWhat do you press?'),
    ('c3','c', 'While crawling through the vents, you receive a message from B.O.B.B.Y.\n”Captain, according to your location you should be right above the prisoner.“\n You look down the open grate and see a stoic man, sitting on his bed, staring at the glass display of his cell in front of him.\nHow do you approach?'),
    ('c4','c', 'After meeting the prisoner and consulting with \nB.O.B.B.Y. you decide best way to escape is to use the \nventilation system at the yard that connects to the space laundry chute \nfor shipping and receiving.\nQuestion is\n…\nHow do you get there?'),
    ('c5','c', 'As you’re walking the prisoner towards the yard a guard approaches you.\n”Hey are you new here?”\n…\nYou nervously respond but he seems to believe you.“Yard hours are ending soon, make sure he gets back to his cell,\nAfter he found whatever he lost of course.”\nThe guard walks past you and continues his normal patrol.\nSuddenly he stops in his tracks.\n”All guards, be on the lookout for a possible intruder in the complex.” blares the intercom.\nThe guard looks towards you. \n “Hey {name}, so if you’re really a guard, \nwhat is his name?”'),
    ('c6','c', 'The rest of the plan is executed perfectly.…\nBack on the ship Captain Barlock hails you again. \n“Thank you {name}, I could’ve have done this without your brave stupidity\nor whatever you wanna call it.\n You deserve a reward, what do you want?”'),
    ('d1','d', '“{name}, wake up! We got space mail and front-row tickets for your favorite band,Singular Mediocre Stone. \n Since you’re their biggest fan they want you to choose their opening song!\n What should I tell them to play Captain?”');

INSERT INTO
    dbss_choices (
        "linkedTo", "choiceType", score, health_lost, alignment,
        choice
    )
VALUES
    (
        'a1','goblin', 2500, 0, 'chaotic',
        '*recites your name in gobish*'
    ),
    (
        'a1', 'alien', 2500, 0, 'neutral',
        '*Gurgles* "I''m an alien!"'
        
    ),
    (
        'a1', 'human', 2500, 0, 'lawful',
        '"Hello There! Just an average human."'
    ),
    (
        'a1', 'space_wizard', 1250, 0, 'lawful',
        '*bows* "An elegant wizard at your service."'
    ),
    (
        'a1', 'astral_thief', 1250, 0, 'neutral',
        '*scoffs* "Ha, Thief Extraordinaire..."'
        
    ),
    (
        'a1', 'cosmic_warrior', 1250, 0, 'chaotic',
        '"GWARH! STRONG WARRIOR AM I!"'
    ),
    (
        'a1', 'default', 1000, 0, 'neutral',
        '"Hey there, just a pilot."'
    ),
    (
        'a1', 'default', 1000, 0, 'neutral',
        '"That''s none of your business who I am to you."'
    ),
    (
        'b1', 'goblin', 2500, 0, 'chaotic',
        'Growl at the Manuels'
    ),

    (
        'b1', 'alien', 2500, 0, 'lawful',
        'Run an analysis in your head.'
    ),

    (
        'b1', 'human', 2500, 0, 'neutral',
        'Take a moment to think.'
    ),
    (
        'b1', 'space_wizard', 1250, 0, 'lawful',
        'Cast a spell to analyze the ship.'
    ),

    (
        'b1', 'astral_thief', 1250, 0, 'neutral',
        'Consult the stars'
    ),

    (
        'b1', 'cosmic_warrior', 1250, 0, 'chaotic',
        '“WHAT MANUEL?”'
    ),

    (
        'b1', 'default', 1000, 0, 'lawful',
        'Run an analysis on the ship.'
    ),

    (
        'b1', 'default', 1000, 0, 'chaotic',
        '“Wait did you mean manuals not Manuels?”'
    ),
    (
        'b2', 'goblin', 2500, 0, 'chaotic',
        'Play your Gwar Gwar drums'
    ),

    (
        'b2', 'alien', 2500, 0, 'neutral',
        'Ponder'
    ),

    (
        'b2', 'human', 2500, 0, 'lawful',
        'Find the engine manual'
    ),
    (
        'b2', 'space_wizard', 1250, 0, 'lawful',
        'Find your emergency scroll'
    ),

    (
        'b2', 'astral_thief', 1250, 0, 'chaotic',
        'Play your guitar'
    ),

    (
        'b2', 'cosmic_warrior', 1250, 0, 'neutral',
        '"THINK?"'
    ),

    (
        'b2', 'default', 1000, 0, 'neutral',
        'Humor the thought and move on'
    ),

    (
        'b2', 'default', 1000, 0, 'lawful',
        'Search for a toolbox'
    ),
    (
        'b3', 'goblin', 2500, 0, 'chaotic',
        'Spit and stab the engine to cool it.'
    ),

    (
        'b3', 'alien', 2500, 0, 'lawful',
        'Use your mind control to repair the engine'
    ),

    (
        'b3', 'human', 2500, 0, 'neutral',
        'Give into the panic'
    ),
    (
        'b3', 'space_wizard', 1250, 0, 'lawful',
        'Cast a cooling spell and begin repairs'
    ),

    (
        'b3', 'astral_thief', 1250, 0, 'neutral',
        ' Use your star dagger to repair the engine'
    ),

    (
        'b3', 'cosmic_warrior', 1250, 0, 'chaotic',
        'PUNCH EVERYTHING'
    ),

    (
        'b3', 'default', 1000, 0, 'neutral',
        'Do nothing'
    ),

    (
        'b3', 'default', 1000, 0, 'lawful',
        'Repair the parts from your observation'
    ),
    (
        'b4', 'goblin', 2500, 0, 'chaotic',
        'Show them how goblins dance'
    ),

    (
        'b4', 'alien', 2500, 0, 'lawful',
        'Glare at them'
    ),

    (
        'b4', 'human', 2500, 0, 'neutral',
        'Offer them your open hand'
    ),
    (
        'b4', 'space_wizard', 1250, 0, 'lawful',
        ' Cast the cretins to the next dimension'
    ),

    (
        'b4', 'astral_thief', 1250, 0, 'lawful',
        'Threaten them with your dagger'
    ),

    (
        'b4', 'cosmic_warrior', 1250, 0, 'chaotic',
        '"PARTY TIME"'
    ),

    (
        'b4', 'default', 1000, 0, 'neutral',
        'Coexists with them'
    ),

    (
        'b4', 'default', 1000, 0, 'lawful',
        'Kick them out'
    ),
    (
        'c1', 'goblin', 2500, 0, 'chaotic',
        ' *rashberry noises* “Yooba-Dooba-Dooba”'
    ),

    (
        'c1', 'alien', 2500, 0, 'lawful',
        'Agree to help this human'
    ),

    (
        'c1', 'human', 2500, 0, 'neutral',
        '“Ok..I guess.”'
    ),
    (
        'c1', 'space_wizard', 1250, 0, 'chaotic',
        '"I don’t deal with criminals."'
    ),

    (
        'c1', 'astral_thief', 1250, 0, 'neutral',
        '"Outlaws should stick together."'
    ),

    (
        'c1', 'cosmic_warrior', 1250, 0, 'neutral',
        '"YOU STRONG ME HELP."'
    ),

    (
        'c1', 'default', 1000, 0, 'neutral',
        'Reluctantly agree'
    ),

    (
        'c1', 'default', 1000, 0, 'chaotic',
        'Decline his demands'
    ),
    (
        'c2', 'goblin', 2500, 0, 'chaotic',
        'Press the shiniest button'
    ),

    (
        'c2', 'alien', 2500, 0, 'lawful',
        'Use telekinesis to press all of the buttons'
    ),

    (
        'c2', 'human', 2500, 0, 'chaotic',
        'Press your favorite colored button'
    ),
    (
        'c2', 'space_wizard', 1250, 0, 'lawful',
        'Cast a spell to choose a button for you.'
    ),

    (
        'c2', 'astral_thief', 1250, 0, 'neutral',
        'Close your eyes and toss your dagger at the panel'
    ),

    (
        'c2', 'cosmic_warrior', 1250, 0, 'neutral',
        'Hurl your axe at the panel'
    ),

    (
        'c2', 'default', 1000, 0, 'neutral',
        'Press the blue button'
    ),

    (
        'c2', 'default', 1000, 0, 'lawful',
        'Press the red button'
    ),
    (
        'c3', 'goblin', 2500, 0, 'chaotic',
        'Jump down to surprise him'
    ),

    (
        'c3', 'alien', 2500, 0, 'lawful',
        'Speak to him with mind control.'
    ),

    (
        'c3', 'human', 2500, 0, 'neutral',
        'Play it safe and call to him from the vent'
    ),
    (
        'c3', 'space_wizard', 1250, 0, 'lawful',
        'Cast a projection of yourself in front of him.'
    ),

    (
        'c3', 'astral_thief', 1250, 0, 'neutral',
        'Remain unseen and talk to him from the vent'
    ),

    (
        'c3', 'cosmic_warrior', 1250, 0, 'chaotic',
        'Greet your fellow warrior like a man'
    ),

    (
        'c3', 'default', 1000, 0, 'neutral',
        'Call to him from the vent'
    ),

    (
        'c3', 'default', 1000, 0, 'chaotic',
        'Introduce yourself'
    ),
    (
        'c4', 'goblin', 2500, 0, 'chaotic',
        ' “Run fast, hooman.”'
    ),

    (
        'c4', 'alien', 2500, 0, 'neutral',
        '“Let’s be smart about this, call the guard human.”'
    ),

    (
        'c4', 'human', 2500, 0, 'lawful',
        '“Let’s go the way I came”'
    ),
    (
        'c4', 'space_wizard', 1250, 0, 'neutral',
        'Cast a spell to trick the guard.'
    ),

    (
        'c4', 'astral_thief', 1250, 0, 'lawful',
        'Stay in the shadows, move through the vents.'
    ),

    (
        'c4', 'cosmic_warrior', 1250, 0, 'chaotic',
        'Break the glass cell and rush out.'
    ),

    (
        'c4', 'default', 1000, 0, 'neutral',
        'Tell the prisoner to call the guard'
    ),

    (
        'c4', 'default', 1000, 0, 'lawful',
        'Use the vents towards the yard'
    ),
    (
        'c5', 'goblin', 2500, 0, 'chaotic',
        '“Gwarspeh”'
    ),

    (
        'c5', 'alien', 2500, 0, 'neutral',
        'Read the prisoners mind for his name'
    ),

    (
        'c5', 'human', 2500, 0, 'lawful',
        '*laugh nervously* “Aren’t all prisoners the same?”'
    ),
    (
        'c5', 'space_wizard', 1250, 0, 'neutral',
        '*wave your hand* “We are not the ones you’re looking for”'
    ),

    (
        'c5', 'astral_thief', 1250, 0, 'lawful',
        'Persuade the guard'
    ),

    (
        'c5', 'cosmic_warrior', 1250, 0, 'chaotic',
        'Yell nonsense'
    ),

    (
        'c5', 'default', 1000, 0, 'neutral',
        'Joey'
    ),

    (
        'c5', 'default', 1000, 0, 'lawful',
        'Joseph'
    ),
    (
        'c6', 'goblin', 650, 0, 'chaotic',
        '“*rashberry noises* Yooba-Dooba-Dooba”'
    ),

    (
        'c6', 'alien', 650, 0, 'lawful',
        '“Passage to my home planet.”'
    ),

    (
        'c6', 'human', 650, 0, 'lawful',
        '“A chance to go back to Earth Captain”'
    ),
    (
        'c6', 'space_wizard', 1250, 0, 'neutral',
        '“Spells, baubles, nicknacks of the sort”'
    ),

    (
        'c6', 'astral_thief', 1250, 0, 'neutral',
        '"A new dagger would be nice, then I’ll call it even"'
    ),

    (
        'c6', 'cosmic_warrior', 1250, 0, 'neutral',
        '"ME? AXE STRONG SHINY"'
    ),

    (
        'c6', 'default', 1000, 0, 'neutral',
        '“A new ship?”'
    ),

    (
        'c6', 'default', 1000, 0, 'chaotic',
        '“I don’t take handouts”'
    ),
    (
        'd1', 'goblin', 2500, 0, 'chaotic',
        '“Play Gwar Gwar beats”'
    ),

    (
        'd1', 'alien', 2500, 0, 'chaotic',
        '“Play Outerstellar music”'
    ),

    (
        'd1', 'human', 2500, 0, 'lawful',
        '"Play Rocking the Game”'
    ),
    (
        'd1', 'space_wizard', 1250, 0, 'lawful',
        '"Play Dropping Spells and Taking Names"'
    ),

    (
        'd1', 'astral_thief', 1250, 0, 'neutral',
        '“Play A Dance of Daggers”'
    ),

    (
        'd1', 'cosmic_warrior', 1250, 0, 'chaotic',
        '“PLAY AXE ME A QUESTION”'
    ),

    (
        'd1', 'default', 1000, 0, 'neutral',
        'Play Space is Cool'
    ),

    (
        'd1', 'default', 1000, 0, 'lawful',
        'Play Video Game Land'
    );
    

INSERT INTO
    dbss_responses ("linkedTo", alignment, response, game_ending)
VALUES
    ('a1', 'chaotic', 'Interesting…….uh….....response Captain.\n\n Aside from that, you’ve just answered your first question!\nFrom this point on, I will be your narrator and help “guide” your decisions through any predicaments you may encounter,\nI may advise against some or even praise others.\nRegardless, this is YOUR STORY. Don’t let me influence you, but keep in mind, this story is fairly linear, the only things that are truly unique are your choices and the responses. Maybe in the near future, my creator will rebuild this game engine to incorporate legitimate story pathing when he isn’t restricted by time constraints. \n Enough of the “meta talk”, once you’re ready hit Continue to start the first day of your story.\n\n HINT: If I talk too slow for you, click on text to make me say everything at once!', false),
    ('a1', 'neutral', 'Nice to meet you Captain, you seem capable of handling a ship.\n\n Aside from that, you’ve just answered your first question!\nFrom this point on, I will be your narrator and help “guide” your decisions through any predicaments you may encounter,\nI may advise against some or even praise others.\nRegardless, this is YOUR STORY. Don’t let me influence you, but keep in mind, this story is fairly linear, the only things that are truly unique are your choices and the responses. Maybe in the near future, my creator will rebuild this game engine to incorporate legitimate story pathing when he isn’t restricted by time constraints.\n Enough of the “meta talk”, once you’re ready hit Continue to start the first day of your story.\n\n HINT: If I talk too slow for you, click on text to make me say everything at once!', false),
    ('a1', 'lawful', 'A pleasure to meet you Captain. Refreshing to meet someone of your caliber.\n\n Aside from that, you’ve just answered your first question!\nFrom this point on, I will be your narrator and help “guide” your decisions through any predicaments you may encounter,\nI may advise against some or even praise others.\nRegardless, this is YOUR STORY. Don’t let me influence you, but keep in mind, this story is fairly linear, the only things that are truly unique are your choices and the responses. Maybe in the near future, my creator will rebuild this game engine to incorporate legitimate story pathing when he isn’t restricted by time constraints. \n Enough of the “meta talk”, once you’re ready hit Continue to start the first day of your story.\n\n HINT: If I talk too slow for you, click on text to make me say everything at once!', false),
    ('b1', 'chaotic', '“Captain, they are Manuels, look.”\nYou stare at the little people running around in a panic as the ship’s alarms continue blaring.\nOne blankly stares at you and hops on to your shoulder.\nIt yells into your ear, “PARTY TIME” and starts tearing the actual ship manuals apart. \n You flick it off your shoulder.\n\nAs weird and creepy as these things are, you decide to head to the engine bay on your own accord.\nA gang of Manuels revolting and tearing the ship apart sound fun to keep around. \nYou decide to save the ship to keep them alive\n…\nat least for now.', false),
    ('b1', 'neutral', 'Like any “normal” being, you take a deep breath and stare at the screen for a few seconds to get your bearings.\n\n “Feeling better now Captain? You should probably fix the engines”.\nAgreeing with your fellow companion, you decide to head to the engine room.\n\nWouldn’t be a ship anymore if it exploded.\n\nAs you head to the engine room, you ponder a thought,\n”Did B.O.B.B.Y mean manuals not Manuels?”', false),
    ('b1', 'lawful', 'After gaining a grasp on the situation. The analysis reveals that the engine’s cryosphere is damaged.\nIt also revealed a group of stowaways taking residence in your ship, they refer to themselves as “The Manuels”.\n\n“Excellent analysis, Captain”\n\n Despite B.O.B.B.Y.’s sarcastic comment you head to the engine room and think to yourself,\n”Was B.O.B.B.Y hiding them? Who attacked us?”', false),
    ('b2', 'chaotic', 'You head to the music room to play your favorite instrument for a few minutes.\n\n…\n\n…\n\n…\n The music calms you and you’re able to think clearly.\n“I can do this,” you say to yourself as you confidently head towards the engine room.', false),
    ('b2', 'neutral', 'You begin to question what caused this explosion.\n“Is  B.O.B.B.Y. working against you?” \n\n…\n\n…\n “He can’t be right? He’s my fellow companion”\n You stare profusely at the wall next to you before moving on.', false),
    ('b2', 'lawful', 'You head to your quarters in search of the item.\n\n…\n\n…nothing...\n\nYou stop searching for the item once you realize how much time you’ve wasted.\n”Good Job, me.” you thought to yourself as you sprint towards the engine room.', false),
    ('b3', 'chaotic', 'The engine roars in pain.\n\n...\n\n...\n“Captain, your stupidity fixed it.”\n\nMiraculously your actions bent the engine back into shape, literally.\n\nYou pat yourself on the back and compliment yourself as you walk back to ask B.O.B.B.Y about the Manuels.', false),
    ('b3', 'neutral', 'You give into the anxiety and pressure that was presented upon you,\n “It was an honor to be on this journey, Captain.”\n\n...\n\n…\nThe last thing you see is a wall of fire rushing towards as your vision begins to fade to black.', true),
    ('b3', 'lawful', 'As you gracefully repair the engine you notice it starts to ease up and cool down to its normal hum.\n\n”Captain, we’re alive!”\nYou laugh at B.O.B.B.Y.’s remark,\ncomputers should have no concept of what it means to be “Alive,”\nYou head back to ask B.O.B.B.Y about the Manuels.', false),
    ('b4', 'chaotic', 'You decide to party with your new friends in celebration of staying alive today.\n…\n…\n…\nOnce the party died down you went straight to your quarters.\nThe thought of what caused the damage never crossed your mind again.', false),
    ('b4', 'neutral', 'You decide to coexist with the Manuels, \ngiven how they seem like good people at least from looks.\n“Thank you Captain, you won’t regret this.”\n...\nYou gather your best space food tubes and share them with your new friends before heading to bed to contemplate today’s events.', false),
    ('b4', 'lawful', '\nThe Manuels can clearly sense your intentions and decide to leave the ship before the situation escalates.\nIs B.O.B.B.Y. deflecting and vouching for a group of stowaways on your ship?\n\n…\n\n Having not found the cause of the damage on the ship you decide it probably best to not trust these small strangers.\n\n”Captain, I...”\nYou ignore B.O.B.B.Y. and head to your quarters to turn in for the day.', false),
    ('c1', 'chaotic', 'Captain Harlock stares at his telecom in disgust.\n…\n...\n“Well it was nice talking to you, Captain”\nCaptain Barlock fires his gauss cannon towards the ship.\n…\nThe ship ruptures from the force of the impact and explodes before you could even finish the words…\n\n oops.', true),
    ('c1', 'neutral', 'Given the situation you decide it would be best to comply with Barlock\nWho knows maybe there’s an award in it for you!\n…\nUpon arrival at the prison,  B.O.B.B.Y. gives you his thoughts.\n”Captain, when you enter the prison the best possible route inside\nwill be the garbage chute and whatever you do.\nDO NOT PRESS THE RED BUTTON” You enter the inconspicuous hole in the side of the prison and slide down the chute.', false),
    ('c1', 'lawful', 'After considering the pros and cons, you decide to help this outlaw even though \nit goes against the very morales of your character.\n…\n“Captain, we’re approaching the Prison. You sh-”\n Upon a quick glance at the prison as it came into view you notice a weird inconspicuous hole in the side of the prison.\nYour hurt pride causes you to lose focus and before B.O.B.B.Y. couldn’t finish his sentence,\nyou strap on your space gear and enter the convenient entrance and slide down a chute.', false),
    ('c2', 'chaotic', 'On a whim you trust your gut and press the button\n…\n…\nThe walls begin rumbling \nand then slows into a grinding halt.\nA vent grate unlatches above you and you gain access to the ventilation system.\nThe vent is fairly cramped and gives you slight claustrophobia, \nnevertheless you push on through.', false),
    ('c2', 'neutral', 'The panel beeps with confirmation from what you did.\n…\n…\nThe walls begin rumbling \nand then slows into a grinding halt.\nA vent grate unlatches above you and you gain access to the ventilation system.\nThe vent is fairly cramped and gives you slight claustrophobia, \nnevertheless you push on through.', false),
    ('c2', 'lawful', 'The panel beeps with confirmation from what you did.\n…\n…\nThe walls begin the close in faster\nThe last thought that crosses your mind before your imminent death is\n”I knew this was familiar, Episode IV ”', true),
    ('c3', 'chaotic', 'You break the vent open and jump down in front of the prisoner.\nUnfazed from your sudden entrance the prisoner stares at you with a brazen look.\n“You’re either 99 kinds of stupid, or that eager to meet a man like me,” he laughs. \nHe then proceeds to reach out his hand,\n”I’m Joseph.”\nAfter shaking his hand you realize that you could probably become friends with this man.\n...\nDespite his current situation of course.', false),
    ('c3', 'neutral', 'The prisoner looks up to you\n“About time you show up.” he says.\n“The only kind of people who don’t show their face are either cowards \nor assassins hired to kill me. But I assume you’re the former. ”\n…\n”So, what’s the plan coward?”', false),
    ('c3', 'lawful', 'The prisoner looks in bewilderment from your actions.\nAfter a moment he begins to laugh, \n”Interesting tricks, I assume you’re here to break me out?”\n…\n”I’m Joseph, so what’s the plan, chief?”', false),
    ('c4', 'chaotic', 'You obnoxiously break through the cell glass and the prisoner follows behind you\n...alarms blare…\n…The guards shoot towards you and the prisoner.', true),
    ('c4', 'neutral', 'The prisoner calls a guard over to his cell.\n…\n”Hey man, the vent above me is busted” says the prisoner.\nThe guard reaches for his comms but before he could report\nYou and the prisoner spring into action.\n...\nAfter knocking the guard out and hiding him in the vent above\nyou disguise yourself as the guard and escort the prisoner out of the cell.', false),
    ('c4', 'lawful', 'You decide get to the yard through the vent with the prisoner\n…*creak*...\n…*metal groans*\nThe vent bends and collapses under the weight of you and the prisoner.\nYou land on top of a desk, \ndazed and in pain, you manage to read a desk name plate with the name\n”Warden - Scarlett M.”', true),
    ('c5', 'chaotic', 'Did you say “Joseph?”\nThe guard laughs\n…\n…\n”Be on the lookout for that intruder”\nThe guard tells you before he continues his route.\n...Close one.', false),
    ('c5', 'neutral', 'The guard laughs, “I don’t think it’s you.”\n He resumes his patrol and you head towards the yard.\n…\n…\nMoments before you reach the entrance to the yard you are stopped by\na massive wall of guards and guns.', true),
    ('c5', 'lawful', 'The guard laughs\n…\n…\n”It is your first day huh, I’ll cut you some slack. \nPlus anyone who is crazy enough to break in here must be out of their mind.”\n…\n”Be on the lookout for that intruder”\n He continues his patrol and you head towards the yard.', false),
    ('c6', 'chaotic', '“Well said my friend, well said.\n Don’t be afraid to say hello If I’m in the neighborhood again.”\nCaptain Harlock initiates his warp drive and vanishes into slipspace.\nYou head to your quarters puzzled with the thoughts of Captain Barlock\n”What an interesting character.”\nYou mumble to yourself before you fall into a deep slumber.', false),
    ('c6', 'neutral', '“Unfortunately, I cannot grant those wishes yet.\nFor this journey does not require you to have them\n..yet.”\nYou head to your quarters puzzled with the thoughts Captain Barlock imprinted into your head.\n”What the heck was he talking about?”\nYou mumble to yourself before you fall into a deep slumber.', false),
    ('c6', 'lawful', '“Ah homesick are you?\nMaybe in the near future when our universe is expanded and we can explore new planets,\nfight bosses and attend more space concerts. You will get your wish.\nbut for now enjoy this teaser of future content.”\nYou head to your quarters puzzled with the thoughts Captain Barlock imprinted into your head.\n”What the heck was he talking about?”\nYou mumble to yourself before you fall into a deep slumber.', false),
    ('d1', 'chaotic', 'You go to the concert\n…\nchop\nchop\nchop\n...After attending the concert of your favorite band, you head to your ship and immediately go straight to your quarters.\nThe chops and beats continue to play in your head.', false),
    ('d1', 'neutral', 'You go to the concert\n…\nbump\nbump\nbump\n...After attending the concert of your favorite band, you head to your ship and immediately go straight to your quarters.\nThe catchy rhythm continues to play in your head.', false),
    ('d1', 'lawful', 'You go to the concert\n…\nbang\nbang\bang\n...After attending the concert of your favorite band, you head to your ship and immediately go straight to your quarters.\nThe banging rhythm makes you headbang yourself to sleep.', false);

COMMIT;

