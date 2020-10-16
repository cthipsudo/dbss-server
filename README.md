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
RESPONSE 200
Headers Content-Type:application/json
Body `[ 
    {
        "id": "a1",
        "linkedTo": "a",
        "question": "Hello {name}, I am your Buddy On Board Briefing Yokemate,\\nB.O.B.B.Y. for short.\\n\\nWelcome to Drifting Between Silence and Stardust, a bite-sized interactive choose-your-own-adventure-game.\\nLet's get you up to speed with how the game works.\\nTell me Captain, who are you?"
    }
]`
## About Me
[Github](https://github.com/cthipsudo)

[LinkedIn](https://www.linkedin.com/in/chanpasong-thipphakhinkeo/)

[My Other Projects](https://oscarthipp.com/)

## Server Features coming soon
1. Enum Choice type to be refactored into its own table. 
1. Bosses Table
2. Choice, Response, and Question Tables revamp. 
