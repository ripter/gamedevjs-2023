import { render, html } from '../libs/uhtml/index.mjs';
import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

import { loadStory } from '../utils/loadStory.mjs';
import { parseTags } from '../utils/parseTags.mjs';
import { ChoiceEnounter } from '../components/ChoiceEncounter.mjs';

/**
 * Page for Encounters.
 * Encounters serve as the central gameplay mechanism, providing players with an engaging challenge that tests their abilities, strategies, and luck, and ultimately determines their success or failure in the game.
*/
export async function pageEncounter(selector, storyURL) {
	const story = await loadStory(storyURL);
	console.log('story', story);
	const elm = document.querySelector(selector);
	elm.className = 'page-encounter-screen';
	const state = signal({});
	const bodyText = signal('');
	const choiceList = signal([]);
		
	
	const text = [];
	const tagList = [];	
	while (story.canContinue) {
		text.push(story.Continue());
		// text.push(html`<p>${story.Continue()}</p>`);
		tagList.push(...story.currentTags);
	}
	// bodyText.value = text.map(.join('<br>');
	console.log('text', text);
	bodyText.value = text.map(val => html`<p>${val}</p>`);
	choiceList.value = story.currentChoices;
	const tagState = parseTags(tagList);
	state.value = {...state.value, ...tagState};
	
	
	elm.style.backgroundImage = `url(./imgs/${tagState.background})`;
	render(elm, html`
		<h1>Encounter: ${state.value.title}!</h1>
		<div class='story-text'>
			${bodyText.value}	
		</div>
		<ul class=${`choice-list --count-${choiceList.value.length}`}>
			${choiceList.value.map(item => ChoiceEnounter(item, handleChoiceClick))}
		</ul>
	`);
}

function handleChoiceClick(choiceIdx) {
	console.log('you picked', choiceIdx);	
}