import {app} from './libs/APath.js';
// import { pageTitleScreen } from '../pages/titleScreen.mjs';
import { pageEncounter } from '../pages/encounter.mjs';
import { Player } from '../utils/Player.mjs';
import { Ship } from '../utils/Ship.mjs';

// Create a new Player.
// Put it on window so everyone can use it.
window.player = new Player();
// Create the Ship
// Put it on window so everyone can use it.
window.ship = new Ship();

// Show the Title Screen.
// pageTitleScreen('#gamearea');

// Encounter Screen
pageEncounter('#gamearea', 'ink/encounter-astroid.json');

console.log('app', app);
app
	.get('/test/?query=:query', function (ctx) {
		console.log(ctx);
		/*
		{
			"path": "/test/?query=value",
			"params": {
				"query": "value"
			}
		}
		*/
	})
	.get('/test/:status', function (ctx) {
		console.log(ctx);
		/*
		{
			"path": "/test/OK",
			"params": {
				"status": "OK"
			}
		}
		*/
	});

// intercept all unregistered calls
app.get('*',
	function (ctx, next) {
		console.log(ctx);
		/*
		{
			"path": "/whatever"
		}
		*/
		next();
	},
	// will receive the ctx object too
	console.error
);