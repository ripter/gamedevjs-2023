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
	// url: 'titleScreen',
	// args: [clickToDialog('dialog-start-game')],
	url: 'ship',
	args: [],
});

//
// Handle Page "routes"
effect(() => {
	const {url, args} = currentPage.value;
	console.log('LoadingURL', url, args);
	const elm = document.querySelector('#gamearea');
	// Set the page class on the root to show/hide the correct page.
	elm.className = url;

	// elm.innerHTML = '';
	setTimeout(() => {
		switch(url) {
			case 'dialog':
				console.log('loading dialog page');
				return pageDialog(document.getElementById('page-dialog'), ...args);
			case 'encounter': 
				return pageEncounter(document.getElementById('page-encounter'), ...args);
			case 'ship':
				console.log('loading ship page');
				return pageShip(document.getElementById('page-ship-zone'), ...args);
			case 'yourStats':
				return pageYourStats(document.getElementById('page-your-status'), ...args);
			case 'shipStats':
				return pageShipStats(document.getElementById('page-ship-status'), ...args);
			default:
				return pageTitleScreen(document.getElementById('page-intro'), ...args);
		}	
	}, 1);
});




