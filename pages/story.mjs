import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { loadStory } from '../story/loadStory.mjs';
import { storyGenerator } from '../story/storyGenerator.mjs';
import { MessageBasic } from '../components/MessageBasic.mjs';
import { triggerEvent } from '../events/triggerEvent.mjs';
import { hadEvent } from '../events/hadEvent.mjs';



const { state, dispatch } = window.gameState;
const pageBodyList = signal([]);
const pageChoiceList = signal([]);

const storyURL = 'chars/susan/story.json';

const inkStory = await loadStory(storyURL);
window.story = inkStory;
const genStory = storyGenerator(inkStory, {
	// All the story to trigger game events.
	'triggerEvent': triggerEvent,
	// Returns true if the event has triggered in the past.
	'hadEvent': hadEvent,
});


// Get the necessary DOM elements
const bodyElement = document.querySelector('.body');
const choicesElement = document.querySelector('.choices');

// Let users click/keypress/tap to move the story forward.
document.body.addEventListener('click', tryToLoadNextLine);
document.body.addEventListener('keypress', tryToLoadNextLine);
document.body.addEventListener('touchend', tryToLoadNextLine);
/**
 * TRY to move on to the next story line.
 * There are gamestates where the user is not allowed to move on,
 * that is why this function will try, but not garentee.
 */
function tryToLoadNextLine() {
	processNextStoryLine();
}

//
// Handle Choice Click
const handleChoiceClick = (event) => {
  const choiceIndex = parseInt(event.target.dataset.index);
  inkStory.ChooseChoiceIndex(choiceIndex);
	pageBodyList.value = [];
  processNextStoryLine();
};


//
// Function to process the next line of the story
const processNextStoryLine = () => {
	const { value, done } = genStory.next();
	// Nothing to do when we are done with the story.
	// This also happens when we are waiting on the player to make a choice.
	if (done) { return; }
  const { body, tags, choiceList } = value;

	// Append the new body text to the existing.
	pageBodyList.value = [
		...pageBodyList.value,
		body,
	].filter(txt => txt !== '');
	console.log('pageBodyList.value', pageBodyList.value);

  // Update the choices element with the available choices
	pageChoiceList.value = [...choiceList];
};


//
// Render .body when bodyList changes.
effect(() => {
	console.log('bodyText.value', pageBodyList.value);

	render(bodyElement, () => html`
		${pageBodyList.value.map((text) => MessageBasic({text}))}
	`);
	// render(bodyElement, () => html`${pageBodyList.value.map(txt => MessageBasic({
	// 	text: txt,
	// })))` ;
	// // render(bodyElement, () => html`${pageBodyList.value.map(txt => html`<p>
	// // 	${txt}
	// // </p>`)}`);
});
//
// Render .choices
effect(() => {
	render(choicesElement, () => html`
		${pageChoiceList.value.map((choice, index) => html`
			<button class="choice" data-index="${index}" @click=${handleChoiceClick}>${choice.text}</button>
		`)}
	`);
});

//
// Start processing the story by generating the first line
processNextStoryLine();