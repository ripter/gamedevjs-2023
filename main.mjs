// import { pageTitleScreen } from '../pages/titleScreen.mjs';
import { pageEncounter } from '../pages/encounter.mjs';
import { Player } from '../utils/Player.mjs';

// Create a new Player.
// Put it on window so everyone can use it.
window.player = new Player();

// Show the Title Screen.
// pageTitleScreen('#gamearea');

// Encounter Screen
pageEncounter('#gamearea', 'ink/encounter-astroid.json');