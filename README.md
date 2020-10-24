# Drifting between Silence and Stardust version 1.0 [Client](https://github.com/cthipsudo/dbss-app-client) | [Server](https://github.com/cthipsudo/dbss-server)
Drifting Between Silence and Stardust is a "Choose-your-own-Adventure" game that features character creation, randomly shuffled encounters and character specific choices for each encounter based on a selected character's traits. Winners of the game are given the option to add their initials to the scoreboard, which can be filtered by Recent or Top scores.

# [Play now!](https://dbss-client.vercel.app/)
This back-end server was built with using **ExpressJS**, **NodeJs**, and **Postgresql**.

## Set up (for local use)
Curious about setting up the game for you own personal use?
1. clone this server to a directory
1. run `npm install` to ensure all dependencies are installed.
1. create a dbss database on your machine
1. create a .env file with 3 variables, a token that matches the client token, a JWT Secret, a database url that links to the local dbss database;
      1. `DATABASE_URL="your local dbss address"`
      1. `JWT_SECRET="some-secret-right"`
      1. `API_TOKEN="Anything here and also matches the local client token."`
1. run `npm migrate` to create all the tables for the dbss database;
1. seed your database with the seed file provide. 
1. run the following commands to start the server, start the server with nodemon, and to run test.
      1. `npm start`
      1. `npm run dev`
      1. `npm test`

## Endpoints

### Questions
#### GET `http://localhost:8000/api/questions`
##### RESPONSE: 200
##### Headers: Content-Type:application/json
##### Body: 
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
##### RESPONSE: 200
##### Headers: Content-Type:application/json
##### Body: 
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
##### RESPONSE: 200
##### Headers: Content-Type:application/json
##### Body: 
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
##### Parameters 
**playerid** | The id of the player. | **Example:** 2 | **Integer**
##### Headers:
Content-Type: application/json

Authorization: Bearer "JWT HERE"

##### RESPONSE: 200
##### Headers: Content-Type:application/json
##### Body: 
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
---
#### DELETE `http://localhost:8000/api/char-save/:playerid/:slotnum`
##### Parameters 
**playerid** | The id of the player. | **Example:** 2 | **Integer**
**slotnum** | The number of the slot of the character. | **Example:** 2 | **Fixed Integer** of either **1, 2, or 3**
##### Headers:
Content-Type:application/json

Authorization: Bearer "JWT HERE"

##### RESPONSE: 204 No Content
---
#### POST `http://localhost:8000/api/char-save/:playerid/slot-num:slotnum`
##### Parameters 
**playerid** | The id of the player. | **Example:** 2 | **Integer**
**slotnum** | The number of the slot of the character. | **Example:** 2 | **Fixed Integer** of either **1, 2, or 3**
##### Headers:
Content-Type: application/json

Authorization: Bearer "JWT HERE"
##### Body: 
```
{
    "char_name": "Millie",
    "char_class": 2,
    "char_race": 2
}
```

##### RESPONSE: 201 Created
##### Headers: Content-Type:application/json
##### Body: 
```
{
    "id": 15,
    "user_id": 1,
    "slot_num": 3,
    "char_name": "Millie",
    "char_class": 2,
    "char_race": 2
}
```
---
#### PATCH `http://localhost:8000/api/char-save/:playerid/slot-num:slotnum`
##### Parameters 
**playerid** | The id of the player. | **Example:** 2 | **Integer**
**slotnum** | The number of the slot of the character. | **Example:** 2 | **Fixed Integer** of either **1, 2, or 3**
##### Headers:
Content-Type: application/json

Authorization: Bearer "JWT HERE"
##### Body: 
```
{
    "char_name": "Millie",
    "char_class": 2,
    "char_race": 2
}
```

##### RESPONSE: 200 Ok
##### Headers: Content-Type:application/json
##### Body: 
```
{
    "message": "char updated"
}
```

### Scoreboard
#### GET `http://localhost:8000/api/scoreboard/:filter`
##### Parameters 
**filter** | Scoreboard Filter for either **Top** or **Recent** scores. | **Example:** Recent | **String**

##### RESPONSE: 200
##### Headers: Content-Type:application/json
##### Body: 
```
[ 
    {
        "id": 2,
        "nick_name": "TES",
        "score": 17250,
        "date_created": "2020-10-15T22:49:55.943Z"
    },
    {
        "id": 1,
        "nick_name": "Ouo",
        "score": 14150,
        "date_created": "2020-10-15T21:44:48.841Z"
    }
]
```
---
#### POST `http://localhost:8000/api/scoreboard`
##### Headers:
Content-Type: application/json

Authorization: Bearer "Client Game Token Here"
##### Body: 
```
{
    "nick_name": "APR",
    "score": 4560
}
```

##### RESPONSE: 201 Created
##### Headers: Content-Type:application/json
##### Body: 
```
{
    "id": 3,
    "nick_name": "APR",
    "score": 666,
    "date_created": "2020-10-16T19:16:43.870Z"
}
```
## About Me
[Github](https://github.com/cthipsudo)

[LinkedIn](https://www.linkedin.com/in/chanpasong-thipphakhinkeo/)

[My Other Projects](https://oscarthipp.com/)

## Server Features coming soon
1. Enum Choice type to be refactored into its own table. 
1. Bosses Table
2. Choice, Response, and Question Tables revamp. 
