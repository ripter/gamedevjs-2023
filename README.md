# GameDevJS-2023
This repository contains the submission for the GameDevJS 2023 jam. The game is built using JavaScript and requires a modern web browser to run.

## How to Run the Game
To run the game, start a static web server in the root directory. Any modern web server should work, and there is no required build step thanks to [JavaScript Modules](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules). Tools like Webpack, RollUp, and Babel are now tools of the past.

Here is an example using Python:

```bash
python3 -m http.server 8000
```

Once the server is running, open a web browser and navigate to **[http://localhost:8000](http://localhost:8000)**. The game should now be running.

## Running Tests
Tests and linting are run using the [Node.js](https://nodejs.org/) tools [Jest](https://jestjs.io/) and [ESLint](https://eslint.org/). You will need to have [Node.js](https://nodejs.org/) installed before you can run these commands.

*Note:* These tools are not required if you only want to run the game. They are only necessary if you plan to develop the game further.

To install or update the necessary tools, run:

```bash
npm install
```

To run ESLint and check the code for errors, run:

```bash
npm run lint
```

To run the tests and verify that everything is working as expected, run:

```bash
npm run test
```

These commands will help ensure that the code is of high quality and meets the requirements of the jam.


# Music Provided By:

```
Song: Nuclear Wave - Arcade Machine
Music provided by Tunetank.
Free Download: https://tunetank.com/track/5395-arcade-machine/
```

