import { render, html } from '../libs/uhtml/index.mjs';
import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

// import { loadStory } from '../utils/loadStory.mjs';
// import { parseTags } from '../utils/parseTags.mjs';
import { Story } from '../utils/Story.mjs';
import { rollDice } from '../utils/rollDice.mjs';
import { getChoiceComponent } from '../utils/getChoiceComponent.mjs';

/* Page Variables */
const state = signal({});
let inkStory;


/**
 * Page for Encounters.
 * Encounters serve as the central gameplay mechanism, providing players with an engaging challenge that tests their abilities, strategies, and luck, and ultimately determines their success or failure in the game.
*/
export async function pageEncounter(selector, storyURL) {
	const story = await Story.load(storyURL, {
		// rollDice function. Rolls dice and sets the "time" variable with the result.
		rollDice: (skillName) => {
			const skillLevel = window.player.skills[skillName];
			const diceResults = rollDice(skillLevel);
			// inkStory.variablesState['time'] = diceResults.reduce((acc, value) => {return acc + value}, 0);
			story.setVariable('time',  diceResults.reduce((acc, value) => {return acc + value}, 0));
		},	
		// Updates the Ship
		updateShip: (propName, deltaValue) => {
			console.log('Change Ship', propName, 'by', deltaValue);
			return "Ok damage the {freakin|strange|large} ship."	
		},	
		// Updates the Player
		updatePlayer:	(propName, deltaValue) => {
			console.log('Change Player', propName, 'by', deltaValue);
			return "Ok damage the {amazing|cool|awesome} player."	
		},
		// Called when the Encounter is over.
		onGameOver: () => {
			console.log('onGameOver');
		},
	});
	// inkStory = await loadStory(storyURL);
	// window.inkStory = inkStory; // for debugging
	//
	// inkStory.BindExternalFunction('rollDice', (skillName) => {
	// 	const skillLevel = window.player.skills[skillName];
	// 	const diceResults = rollDice(skillLevel);
	// 	inkStory.variablesState['time'] = diceResults.reduce((acc, value) => {return acc + value}, 0);
	// });
	//
	// Updates the Ship
	// inkStory.BindExternalFunction('updateShip', (propName, deltaValue) => {
	// 	console.log('Change Ship', propName, 'by', deltaValue);
	// 	return "Ok damage the {freakin|strange|large} ship."	
	// });
	//
	// Updates the Player
	// inkStory.BindExternalFunction('updatePlayer', (propName, deltaValue) => {
	// 	console.log('Change Player', propName, 'by', deltaValue);
	// 	return "Ok damage the {amazing|cool|awesome} player."	
	// });
	//
	// Called when the Encounter is over.
	// inkStory.BindExternalFunction('onGameOver', () => {
	// 	console.log('onGameOver');
	// });
	
	const elm = document.querySelector(selector);
	elm.className = 'page-encounter';

	// run the current story
	state.value = story.next();
	// runFlow();
	
	//
	// Render the page.
	effect(() => {
		const { tags, body, choiceList, turnsLeft } = state.value;
		const { choiceType, background, title } = tags;
		const Choice = getChoiceComponent(choiceType);
		
		elm.style.backgroundImage = `url(./imgs/${background})`;
		render(elm, html`
			<h1>Encounter: ${title}!</h1>
			<div class='story-text'>
				${body}	
			</div>
			<ul class=${`choice-list --count-${choiceList.length}`}>
				${choiceList.map(item => Choice(item, (choiceIdx) => {
					state.value = story.pickChoice(choiceIdx);
				}))}
			</ul>
		`);
	});	
}


/**
 * Clicking on a choice
*/
// function handleChoiceClick(choiceIdx) {
// 	// Select the choice
// 	inkStory.ChooseChoiceIndex(choiceIdx);
// 	// Run the Story
// 	runFlow();
// }


/**
 * Run The InkStory
*/
// function runFlow() {
// 	const text = [];
// 	const tagList = [];	
// 	
// 	while (inkStory.canContinue) {
// 		text.push(inkStory.Continue());
// 		tagList.push(...inkStory.currentTags);
// 	}
// 	const tagState = parseTags(tagList);
// 	
// 	state.value = {
// 		body: text.map(val => html`<p>${val}</p>`),
// 		choiceList: inkStory.currentChoices,
// 		tagState: {
// 			...state.value.tagState,
// 			...tagState,
// 		}
// 	};
// }
