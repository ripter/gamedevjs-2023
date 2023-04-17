import { render, html } from '../libs/uhtml/index.mjs';
import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

import { loadStory } from '../utils/loadStory.mjs';
import { parseTags } from '../utils/parseTags.mjs';
import { rollDice } from '../utils/rollDice.mjs';
import { getChoiceComponent } from '../utils/getChoiceComponent.mjs';

/* Page Variables */
const state = signal({});
let inkStory;


effect(() => {
	console.log('state', state.value);
})


/**
 * Page for Encounters.
 * Encounters serve as the central gameplay mechanism, providing players with an engaging challenge that tests their abilities, strategies, and luck, and ultimately determines their success or failure in the game.
*/
export async function pageEncounter(selector, storyURL) {
	inkStory = await loadStory(storyURL);
	//
	// rollDice function. Rolls dice and sets the "time" variable with the result.
	inkStory.BindExternalFunction('rollDice', (skillName) => {
		const skillLevel = window.player.skills[skillName];
		const diceResults = rollDice(skillLevel);
		inkStory.variablesState['time'] = diceResults.reduce((acc, value) => {return acc + value}, 0);
	});
	
	const elm = document.querySelector(selector);
	elm.className = 'page-encounter-screen';

	// run the current story
	runFlow();
	
	//
	// Render the page.
	effect(() => {
		const { tagState, body, choiceList, turnsLeft } = state.value;
		const { choiceType, background, title } = tagState;
		console.log('tagState', tagState);
		const Choice = getChoiceComponent(choiceType);
		
		elm.style.backgroundImage = `url(./imgs/${background})`;
		render(elm, html`
			<h1>Encounter: ${title}!</h1>
			<div class='story-text'>
				${body}	
			</div>
			<ul class=${`choice-list --count-${choiceList.length}`}>
				${choiceList.map(item => Choice(item, handleChoiceClick))}
			</ul>
		`);
	});	
}


/**
 * Clicking on a choice
*/
function handleChoiceClick(choiceIdx) {
	// Select the choice
	inkStory.ChooseChoiceIndex(choiceIdx);
	// Run the Story
	runFlow();
}


/**
 * Run The InkStory
*/
function runFlow() {
	const text = [];
	const tagList = [];	
	
	while (inkStory.canContinue) {
		text.push(inkStory.Continue());
		tagList.push(...inkStory.currentTags);
	}
	const tagState = parseTags(tagList);
	
	state.value = {
		body: text.map(val => html`<p>${val}</p>`),
		choiceList: inkStory.currentChoices,
		// turnsLeft: inkStory.variablesState['turnsLeft'],
		// isRolling: inkStory.variablesState['isRolling'],
		// skill: inkStory.variablesState['skill'],
		tagState: {
			...state.value.tagState,
			...tagState,
		}
	};
}
