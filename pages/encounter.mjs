import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { getChoiceComponent } from '../utils/getChoiceComponent.mjs';
import { navigateTo } from '../utils/navigateTo.mjs';
import { rollDice } from '../utils/rollDice.mjs';
import { Story } from '../utils/Story.mjs';
import { triggerAchievement } from '../const/events.mjs';

/**
 * Page for Encounters.
 * Encounters serve as the central gameplay mechanism, providing players with an engaging challenge that tests their abilities, strategies, and luck, and ultimately determines their success or failure in the game.
*/
export async function pageEncounter(elm, storyURL) {
	const state = signal({});
	let dispose;
	//
	// Load the story
	const story = await Story.load(`ink/${storyURL}.json`, {
		// rollDice function. Rolls dice and sets the "time" variable with the result.
		rollDice: (skillName) => {
			const skillLevel = window.player.getSkillNumber(skillName);
			const diceResults = rollDice(skillLevel);
			story.setVariable('time',  diceResults.reduce((acc, value) => {return acc + value;}, 0));
			return diceResults.join(', ');
		},	
		'triggerEvent': (code) => {
			triggerAchievement(code);
		},
		'nextPage': (url, args) => {
			dispose();
			navigateTo(url, [args]);
		},
		'getSkillValue': (skillName) => {
			return window.player.getSkillNumber(skillName);
		},
	});
	
	// Start the story
	state.value = story.next();
	
	//
	// Render the page.
	elm.className = 'page page-encounter';
	dispose = effect(() => {
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
