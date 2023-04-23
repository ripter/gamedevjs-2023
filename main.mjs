import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

import { pageTitleScreen } from '../pages/titleScreen.mjs';
import { pageEncounter } from '../pages/encounter.mjs';
import { pageDialog } from '../pages/dialog.mjs';
import { pageShip } from '../pages/ship.mjs';
import { pageYourStats } from '../pages/yourStats.mjs';
import { pageShipStats } from '../pages/shipStats.mjs';

import { clickToDialog } from '../utils/clickToDialog.mjs';
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
	url: 'titleScreen',
	args: [clickToDialog('dialog-start-game')],
	// url: 'ship',
	// args: [],
});

//
// Handle Page "routes"
effect(() => {
	const elm = document.querySelector('#gamearea');

	const {url, args} = currentPage.value;
	console.log('LoadingURL', url, args);

	// elm.innerHTML = '';

	setTimeout(() => {
		switch(url) {
			case 'dialog':
				console.log('loading dialog page');
				return pageDialog(elm, ...args);
			case 'encounter': 
				return pageEncounter(elm, ...args);
			case 'ship':
				console.log('loading ship page');
				return pageShip(elm, ...args);
			case 'yourStats':
				return pageYourStats(elm, ...args);
			case 'shipStats':
				return pageShipStats(elm, ...args);
			default:
				return pageTitleScreen(elm, ...args);
		}	
	}, 1);
});




