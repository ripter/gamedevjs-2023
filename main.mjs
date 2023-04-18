// import { pageTitleScreen } from '../pages/titleScreen.mjs';
import { pageEncounter } from '../pages/encounter.mjs';
import { Player } from '../utils/Player.mjs';
import { Ship } from '../utils/Ship.mjs';
import page from '../libs/page.mjs';

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



page('/home', () => { 
	console.log('home page');
});
