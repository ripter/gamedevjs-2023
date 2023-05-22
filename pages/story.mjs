import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { Story } from '../utils/Story.mjs';
import { MessageBasic } from '../components/MessageBasic.mjs';


const { state, dispatch } = window.gameState;
console.log('load story from state', state);

const storyURL = 'chars/susan/story.json';

//
// Load the story and setup external functions
const story = await Story.load(storyURL, {
	'triggerEvent': (code) => {
		triggerAchievement(code);
	},
});
window.story = story;
console.log('story', story);

/**
 * Page that renders Ink Stories.
*/
export async function pageStory(elm, storyURL) {
	console.log('pageStory', arguments);
	const backgroundImage = signal('imgs/ship.png');
	// const npcLeftImage = signal('chars/lily/imgs/mixer.png');
	let dispose;
	

	// //Set the global vars
	// story.setVariable('timePlayer', window.player.time);
	// story.setVariable('timeSinceLastRun', visitTimes.length > 0 
	// 	? window.player.time - visitTimes[visitTimes.length-1]
	// 	: 0);
	// story.setVariable('totalVisits', visitTimes.length);

	// // Now mark this visit.
	// visitTimes.push(window.player.time);
	// visitLog.set(storyURL, visitTimes);

	// //
	// // Start the story
	// state.value = story.next();
	
	//
	// Render the page.
	// elm.className = 'page page-dialog';
	dispose = effect(() => {
		// const { body, choiceList, tags } = state.value;
		// const { background, npc } = tags;
		// const Choice = getChoiceComponent('basic');

		// if (background) {
		// 	elm.style.backgroundImage = `url(./imgs/${background})`;
		// }
		render(elm, html.for({ storyURL })`
		<link rel="stylesheet" href="css/pages/story.css">
		<div class="page-story">
			<div class="background">
				<img src=${backgroundImage.value} alt="Background Image">
			</div>
			<div class="story">
				${MessageBasic({text: 'Test1', avatarURL: '../chars/lily/imgs/portrait.png'})}	
			</div>
			<div class="options">
				<button>Option 1</button>
				<button>Option 2</button>
				<!-- Add more buttons for more options -->
			</div>
		</div>
		`);	
	});
}