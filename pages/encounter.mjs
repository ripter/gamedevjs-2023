import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { Story } from '../utils/Story.mjs';
import { rollDice } from '../utils/rollDice.mjs';
import { getChoiceComponent } from '../utils/getChoiceComponent.mjs';

/**
 * Page for Encounters.
 * Encounters serve as the central gameplay mechanism, providing players with an engaging challenge that tests their abilities, strategies, and luck, and ultimately determines their success or failure in the game.
*/
export async function pageEncounter(selector, storyURL) {
	const elm = document.querySelector(selector);
	const state = signal({});
	//
	// Load the story
	const story = await Story.load(storyURL, {
		// rollDice function. Rolls dice and sets the "time" variable with the result.
		rollDice: (skillName) => {
			const skillLevel = window.player.skills[skillName];
			const diceResults = rollDice(skillLevel);
			story.setVariable('time',  diceResults.reduce((acc, value) => {return acc + value;}, 0));
		},	
		// Updates the Ship
		updateShip: (propName, deltaValue) => {
			console.log('Change Ship', propName, 'by', deltaValue);
			return 'Ok damage the {freakin|strange|large} ship.';	
		},	
		// Updates the Player
		updatePlayer:	(propName, deltaValue) => {
			console.log('Change Player', propName, 'by', deltaValue);
			return 'Ok damage the {amazing|cool|awesome} player.';	
		},
		// Called when the Encounter is over.
		onGameOver: () => {
			console.log('onGameOver');
		},
	});
	
	// Start the story
	state.value = story.next();
	
	//
	// Render the page.
	elm.className = 'page page-encounter';
	effect(() => {
		const { tags, body, choiceList } = state.value;
		const { choiceType, background, title } = tags;
		const Choice = getChoiceComponent(choiceType);
		
		elm.style.backgroundImage = `url(./imgs/${background})`;
		render(elm, html`
			<h1>Encounter: ${title}!</h1>
			<div class='story-text'>
				${body.map(text => html`<p>${text}</p>`)}	
			</div>
			<ul class=${`choice-list --count-${choiceList.length}`}>
				${choiceList.map(item => Choice(item, (choiceIdx) => {
					state.value = story.pickChoice(choiceIdx);
				}))}
			</ul>
		`);
	});	
}
