import { Story } from '../libs/ink-es6.js';
import { render, html } from '../libs/uhtml/index.mjs';
import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

/**
 * Page for Encounters.
 * Encounters serve as the central gameplay mechanism, providing players with an engaging challenge that tests their abilities, strategies, and luck, and ultimately determines their success or failure in the game.
*/
export async function pageEncounter(selector, storyURL) {
	const elm = document.querySelector(selector);
	elm.className = 'page-encounter-screen';
	const bodyText = signal('');
	const choiceList = signal([]);
	
	// fetch the JSON file
	const response = await fetch(storyURL);	
	if (!response.ok) {
		throw new Error(`Failed to fetch story: "${newValue}"\nError: ${response.statusText}`)
	}
	const story = new Story(await response.json());
	console.log('story', story);
	
	const text = [];
	const rawTags = [];	
	while (story.canContinue) {
		text.push(story.Continue());
		rawTags.push(...story.currentTags);
	}
	bodyText.value = text;
	choiceList.value = story.currentChoices;
	
	render(elm, html`
		<h1>Encounter!</h1>
		<p>
			${html([bodyText.value.join('<br>')])}	
		</p>
		<ul>
			${choiceList.value.map(item => html.for(item)`<li data-choice-id=${item.index} @click=${evt => console.log('click', evt)}>
				${item.text}	
			</li>`)}	
		</ul>
	`);
}
