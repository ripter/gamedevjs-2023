import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { getChoiceComponent } from '../utils/getChoiceComponent.mjs';
import { navigateTo } from '../utils/navigateTo.mjs';
import { Story } from '../utils/Story.mjs';
import { triggerAchievement, gotAchievement } from '../const/achievements.mjs';


const visitLog = new Map();
/**
 * age to handle Dialogs
*/
export async function pageDialog(elm, storyURL) {
	const state = signal({});
	const visitTimes = visitLog.has(storyURL) ? visitLog.get(storyURL) : [];
	let dispose;
	
	//
	// Load the story
	const story = await Story.load(`ink/${storyURL}.json`, {
		'triggerEvent': (code) => {
			triggerAchievement(code);
		},
		'completedEvent': gotAchievement,
		'nextPage': (url, args) => {
			dispose();
			navigateTo(url, [args]);
		},
	});

	//Set the global vars
	story.setVariable('timePlayer', window.player.time);
	story.setVariable('timeSinceLastRun', visitTimes.length > 0 
		? window.player.time - visitTimes[visitTimes.length-1]
		: 0);
	story.setVariable('totalVisits', visitTimes.length);

	// Now mark this visit.
	visitTimes.push(window.player.time);
	visitLog.set(storyURL, visitTimes);

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