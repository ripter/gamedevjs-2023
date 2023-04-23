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
		'triggerEvent': (code) => {
			console.log('code', code);
		},
		'nextPage': (type, arg) => {
			console.log('next page', type, arg);
		},
	});
	
	//
	// Start the story
	state.value = story.next();
	
	//
	// Render the page.
	elm.className = 'page page-dialog';
	effect(() => {
		const { body, choiceList, tags } = state.value;
		const { background, npc } = tags;
		const Choice = getChoiceComponent('basic');
		
		elm.style.backgroundImage = `url(./imgs/${background})`;
		render(elm, html`
			<img class='npc' src=${`./imgs/npcs/${npc}.png`} />
			<div class="position-relative story-text">
				<div class=''>
					${body.map(text => html`<p>${text}</p>`)}	
				</div>
				<ul class=${`choice-list --count-${choiceList.length}`}>
					${choiceList.map((item, choiceIdx) => Choice({item, onClick: () => {
						state.value = story.pickChoice(choiceIdx);
					}}))}
				</ul>
			</div>
		`);	
	});
}