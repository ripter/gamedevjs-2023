import { pageTitleScreen } from '../pages/titleScreen.mjs';
import { pageEncounter } from '../pages/encounter.mjs';
import { Player } from '../utils/Player.mjs';
import { Ship } from '../utils/Ship.mjs';
import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

// Create a new Player.
// Put it on window so everyone can use it.
window.player = new Player();
// Create the Ship
// Put it on window so everyone can use it.
window.ship = new Ship();

// keep track of which page we should show.
const currentPage = window.currentPage = signal({
	url: 'intro',
	args: [],
	// url: 'encounter',
	// args: ['ink/encounter-astroid.json'],

});

// switch pages when it changes
effect(() => {
	const {url, args} = currentPage.value;
	switch(url) {
		case 'encounter': 
			return pageEncounter('#gamearea', ...args);
		default:
			return pageTitleScreen('#gamearea');
	}	
});

// Show the Title Screen.
// pageTitleScreen('#gamearea');

// Encounter Screen
// 'ink/encounter-astroid.json'



