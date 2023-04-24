import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { getChoiceComponent } from '../utils/getChoiceComponent.mjs';
import { Story } from '../utils/Story.mjs';
import { triggerAchievement } from '../const/achievements.mjs';


const visitLog = new Map();
/**
 * Page to handle Dialogs
*/
export async function pageDialog(elm, storyURL) {
	const state = signal({});
	const visitTimes = visitLog.has(storyURL) ? visitLog.get(storyURL) : [];
	let dispose;
	
	//
	// Load the story
	const story = await Story.load(storyURL, {
		'triggerEvent': (code) => {
			triggerAchievement(code);
		},
		'nextPage': (url, arg) => {
			console.log(`Dialog moving to next page "${url}`);
			dispose();
			window.currentPage.value = {
				url,
				args: [arg],
			};
		},
	});

	//Set the global vars
	story.setVariable('timePlayer', window.player.time);
	story.setVariable('timeSinceLastRun', visitTimes.length > 0 ? 
		visitTimes[visitTimes.length-1] - window.player.time
		: 0);
	story.setVariable('totalVisits', visitTimes.length);

	// Now mark this visit.
	visitTimes.push(window.player.time);
	
	//
	// Start the story
	state.value = story.next();
	
	//
	// Render the page.
	elm.className = 'page page-dialog';
	dispose = effect(() => {
		const { body, choiceList, tags } = state.value;
		const { background, npc } = tags;
		const Choice = getChoiceComponent('basic');

		if (background) {
			elm.style.backgroundImage = `url(./imgs/${background})`;
		}
		render(elm, html.for({storyURL})`
			${npc && html`<img class='npc' src=${`./imgs/npcs/${npc}.png`} />`}
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