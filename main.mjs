import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

import { clickToEncounter } from '../utils/clickToEncounter.mjs';
import { pageTitleScreen } from '../pages/titleScreen.mjs';
import { pageEncounter } from '../pages/encounter.mjs';
import { pageDialog } from '../pages/dialog.mjs';
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
	url: 'dialog',
	args: [clickToEncounter('encounter-astroid')],
});

//
// Handle Page "routes"
effect(() => {
	const {url, args} = currentPage.value;
	switch(url) {
		case 'dialog':
			return pageDialog('#gamearea', ...args)
		case 'encounter': 
			return pageEncounter('#gamearea', ...args);
		default:
			return pageTitleScreen('#gamearea', ...args);
	}	
});




