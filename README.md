# Drifting between Silence and Stardust version 1.0 [Client](https://github.com/cthipsudo/dbss-app-client) | [Server](https://github.com/cthipsudo/dbss-server)
Drifting Between Silence and Startdust is a "Choose-your-own-Adventure" game that features character creation, randomly shuffled encounters and character specific choices for each encounter based on a selected character's traits. Winners of the game are given the option to add their initals to the scoreboard, which can by filtered by Recent or Top scores.

This Server was built using ExpressJs to interact with a Postgresql Database.

# [Play now!](https://dbss-client.vercel.app/)
This front-end client was built with using **ReactJS**, **HTML**, and **CSS**.

## Set up (for local use)
Curious about setting up the game for you own personal use?
1. clone this client to a directory
1. run `npm install` to ensure all dependencies are installed.
1. download and run the dbss server and follow it's instructions
1. create a .env file with two variables, a token that matches the server token and a endpoint address that points to your local server address.
      1. `REACT_APP_GAME_TOKEN="any token here"`
      1. `REACT_APP_API_ENDPOINT="http://somelocalhost:1337/api"`
1. run the following commands to start the server, start the server with nodemon, and to run test.
      1. `npm start`
      1. `npm run dev`
      1. `npm test`

## Endpoints

### Questions
#### GET `http://localhost:8000/api/questions`
#### RESPONSE: 200
#### Headers: Content-Type:application/json
#### Body: 
```
[ 
    {
        "id": "a1",
        "linkedTo": "a",
        "question": "Hello {name}, I am your Buddy On Board Briefing Yokemate,\\nB.O.B.B.Y. for short.\\n\\nWelcome to Drifting Between Silence and Stardust, a bite-sized interactive choose-your-own-adventure-game.\\nLet's get you up to speed with how the game works.\\nTell me Captain, who are you?"
    }
]
```
### Choices
#### GET `http://localhost:8000/api/choices`
#### RESPONSE: 200
#### Headers: Content-Type:application/json
#### Body: 
```
[ 
    {
        "id": 1,
        "linkedTo": "a1",
        "choiceType": "goblin",
        "choice": "*recites your name in gobish*",
        "alignment": "chaotic",
        "score": 2500,
        "health_lost": 0
    }
]
```
### Responses
#### GET `http://localhost:8000/api/responses`
#### RESPONSE: 200
#### Headers: Content-Type:application/json
#### Body: 
```
[ 
    {
        "id": 1,
        "linkedTo": "a1",
        "alignment": "chaotic",
        "response": "Interesting…….uh….....response Captain.\\nFrom this point on, I will be your narrator and help “guide” your decisions through any predicaments you may encounter,\\nI may advise against some or even praise others.\\nRegardless, this is YOUR STORY. Don’t let me influence you, but keep in mind, this story is fairly linear, the only things that are truly unique are your choices and the responses. Maybe in the near future, my creator will rebuild this game engine to incorporate legitimate story pathing when he isn’t restricted by time constraints. \\n Enough of the “meta talk”, once you’re ready hit Continue to start the first day of your story.\\n\\n HINT: If I talk too slow for you, click on text to make me say everything at once!",
        "game_ending": false
    }
]
```
### Character Saves
#### GET `http://localhost:8000/api/char-save/:playerid`
#### Parameters 
**playerid** | id of the player **Example:** 2 | **Integer**
#### Headers:
Content-Type:application/json
Authorization: Bearer "JWT HERE"

#### RESPONSE: 200
#### Headers: Content-Type:application/json
#### Body: 
```
[ 
    {
        "user_id": 2,
        "slot_num": 1,
        "char_name": "Benji",
        "class_name": "space_wizard",
        "race_name": "human"
    },
    {
        "user_id": 2,
        "slot_num": 2,
        "char_name": "Spore",
        "class_name": "cosmic_warrior",
        "race_name": "alien"
    },
    {
        "user_id": 2,
        "slot_num": 3,
        "char_name": "Apple",
        "class_name": "astral_thief",
        "race_name": "goblin"
    }
]
```

## About Me
[Github](https://github.com/cthipsudo)

[LinkedIn](https://www.linkedin.com/in/chanpasong-thipphakhinkeo/)

[My Other Projects](https://oscarthipp.com/)

## Server Features coming soon
1. Enum Choice type to be refactored into its own table. 
1. Bosses Table
2. Choice, Response, and Question Tables revamp. 
