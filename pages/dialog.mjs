import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { Story } from '../utils/Story.mjs';
import { getChoiceComponent } from '../utils/getChoiceComponent.mjs';

/**
 * Page to handle Dialogs
*/
export async function pageDialog(selector, storyURL) {
	const elm = document.querySelector(selector);
	const state = signal({});
	
	//
	// Load the story
	const story = await Story.load(storyURL, {
	});
	
	//
	// Start the story
	state.value = story.next();
	
	//
	// Render the page.
	elm.className = 'page-dialog';
	effect(() => {
		const { body, choiceList, tags } = state.value;
		console.log('tags', tags);
		const { background, npc } = tags;
		const Choice = getChoiceComponent('basic');
		
		elm.style.backgroundImage = `url(./imgs/${background})`;
		render(elm, html`
			<img class='npc' src=${`./imgs/npcs/${npc}.png`} />
			<div class='story-text'>
				${body.map(text => html`<p>${text}</p>`)}	
			</div>
			<ul class=${`choice-list --count-${choiceList.length}`}>
				${choiceList.map(item => Choice(item, (choiceIdx) => {
					state.value = story.pickChoice(choiceIdx);
				}))}
			</ul>
		`);	
	})	
}