import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

import { pageTitleScreen } from '../pages/titleScreen.mjs';
import { pageEncounter } from '../pages/encounter.mjs';
import { pageDialog } from '../pages/dialog.mjs';
import { pageShip } from '../pages/ship.mjs';
import { pageYourStats } from '../pages/yourStats.mjs';

import { clickToEncounter } from '../utils/clickToEncounter.mjs';
import { Player } from '../utils/Player.mjs';
import { Ship } from '../utils/Ship.mjs';

// Create a new Player.
// Put it on window so everyone can use it.
window.player = new Player();
// Create the Ship
// Put it on window so everyone can use it.
window.ship = new Ship();

// keep track of which page we should show.
const currentPage = window.currentPage = signal({
	// url: 'intro',
	// args: [clickToEncounter('encounter-astroid')]
	// url: 'dialog',
	// args: [`ink/day1.json`],
	url: 'page',
	args: [],
});

//
// Handle Page "routes"
effect(() => {
	const {url, args} = currentPage.value;
	switch(url) {
		case 'dialog':
			return pageDialog('#gamearea', ...args);
		case 'encounter': 
			return pageEncounter('#gamearea', ...args);
		case 'page':
			return pageShip('#gamearea');
		case 'yourStats':
			return pageYourStats('#gamearea', ...args);
		default:
			return pageTitleScreen('#gamearea', ...args);
	}	
});




