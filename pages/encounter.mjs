import { render, html } from '../libs/uhtml/index.mjs';
import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

import { loadStory } from '../utils/loadStory.mjs';
import { parseStoryTags } from '../utils/parseStoryTags.mjs';

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
		tagList.push(...story.currentTags);
	}
	bodyText.value = text.join('<br>');
	choiceList.value = story.currentChoices;
	const tagState = parseStoryTags(tagList);
	state.value = {...state.value, ...tagState};
	console.log('state', state.value);
	
	elm.style.backgroundImage = `url(./imgs/${tagState.background})`;
	render(elm, html`
		<h1>Encounter: ${state.value.title}!</h1>
		<p class='story-text'>
			${html([bodyText.value])}	
		</p>
		<ul class='choice-list'>
			${choiceList.value.map(item => html.for(item)`<li @click=${() => handleChoiceClick(item.index)}>
				${item.text}	
			</li>`)}	
		</ul>
	`);
}

function handleChoiceClick(choiceIdx) {
	console.log('you picked', choiceIdx);	
}