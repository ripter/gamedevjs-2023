import { pageTitleScreen } from '../pages/titleScreen.mjs';
import { pageEncounter } from '../pages/encounter.mjs';
console.log('Hello World');

// Show the Title Screen.
// pageTitleScreen('#gamearea');

// Encounter Screen
pageEncounter('#gamearea', 'ink/encounter-astroid.json');