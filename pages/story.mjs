import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { hadEvent } from '../events/hadEvent.mjs';
import { triggerEvent } from '../events/triggerEvent.mjs';
import { loadStory } from '../story/loadStory.mjs';
import { storyGenerator } from '../story/storyGenerator.mjs';

// Components
import { ChoiceBasic } from '../components/ChoiceBasic.mjs';
import { MessageBasic } from '../components/MessageBasic.mjs';



const pageBodyList = signal([]);
const pageChoiceList = signal([]);
const storyIsDone = signal(false);

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
	// Obvs, don't try to continue someting that is done.
	if (storyIsDone.value) { return; }
	// if there are choices, then we can't move on.
	if (pageChoiceList.value.length !== 0) { return; }
	processNextStoryLine();
}


//
// Handle Choice Click
const handleChoiceClick = (choice) => {
	if (storyIsDone.value) { return; }
	const { index } = choice;
  // const choiceIndex = parseInt(event.target.dataset.index);
  inkStory.ChooseChoiceIndex(index);
	pageBodyList.value = [];
  processNextStoryLine();
};


//
// Function to process the next line of the story
const processNextStoryLine = () => {
	const { value, done } = genStory.next();
	// Nothing to do when we are done with the story.
	// This also happens when we are waiting on the player to make a choice.
	if (done) { 
		pageBodyList.value = [];
		pageChoiceList.value = [];
		return storyIsDone.value = done; 
	}
  const { body, tags, choiceList } = value;
	console.log('tags', tags);

	// Append the new body text to the existing.
	pageBodyList.value = [
		...pageBodyList.value,
		{body, tags},
	].filter(item => item.body !== '');

  // Update the choices element with the available choices
	pageChoiceList.value = [...choiceList];
};


//
// Render .body when bodyList changes.
effect(() => {
	render(bodyElement, () => html`
		${pageBodyList.value.map(item => MessageBasic({
			text: item.body,
			className: `img--${item.tags.background}`,
		}))}
	`);
});

//
// Render .choices
effect(() => {
	// ChoiceBasic
	render(choicesElement, () => html`
		${pageChoiceList.value.map((choice, index) => ChoiceBasic({
			item: choice, 
			onClick: handleChoiceClick,
			//className: `img--${item.tags.background}`,
		}))}
	`);
});


effect(() => {
	console.log('Story is Done: ', storyIsDone.value);
});

//
// Start processing the story by generating the first line
processNextStoryLine();