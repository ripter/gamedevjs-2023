import { render, html } from '../libs/uhtml/index.mjs';
import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

import { loadStory } from '../utils/loadStory.mjs';
import { parseTags } from '../utils/parseTags.mjs';
import { rollDice } from '../utils/rollDice.mjs';
import { ChoiceEnounter } from '../components/ChoiceEncounter.mjs';

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
	inkStory.BindExternalFunction('rollDice', () => {
		const { skill } = inkStory.variablesState;
		const skillLevel = window.player.skills[skill];
		const diceResults = rollDice(skillLevel);
		console.log('diceresults', diceResults, 'skill', skill)
		inkStory.variablesState['currentDiceTotal'] = diceResults.reduce((acc, value) => {return acc + value}, 0);
		return diceResults.join(', ');
	});
	console.log('story', inkStory);
	const elm = document.querySelector(selector);
	elm.className = 'page-encounter-screen';

	// run the current story
	runFlow();
	
	//
	// Render the page.
	effect(() => {
		const { tagState, body, choiceList, turnsLeft } = state.value;
		elm.style.backgroundImage = `url(./imgs/${tagState.background})`;
		render(elm, html`
			<h1>Encounter: ${tagState.title}!</h1>
			<div class='story-text'>
				${body}	
				<span>${`${turnsLeft} Turns left.`}</span>
			</div>
			<ul class=${`choice-list --count-${choiceList.length}`}>
				${choiceList.map(item => ChoiceEnounter(item, handleChoiceClick))}
			</ul>
		`);
	});	
}

/**
 * Clicking on a choice
*/
function handleChoiceClick(choiceIdx, skill, isRolling) {
	console.log('handleChoiceClick', skill);
	const prevIsRolling = inkStory.variablesState['isRolling'];
	// Update State Vars
	inkStory.variablesState['skill'] = skill;
	isRolling: inkStory.variablesState['isRolling'] = isRolling;
	if (prevIsRolling) {
		inkStory.variablesState['turnsLeft'] = state.value.turnsLeft - 1;
	}
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
		turnsLeft: inkStory.variablesState['turnsLeft'],
		isRolling: inkStory.variablesState['isRolling'],
		skill: inkStory.variablesState['skill'],
		tagState: {
			...state.value.tagState,
			...tagState,
		}
	};
}
