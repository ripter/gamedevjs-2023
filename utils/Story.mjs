import { loadStory } from '../utils/loadStory.mjs';
import { parseTags } from '../utils/parseTags.mjs';

/**
 * Wrapper around the Ink Story
*/
export class Story() {
	constructor(url) {
		this.inkStory = await loadStory(url);
	}
	
	handleChoiceClick(choiceIdx) {
		// Select the choice
		this.inkStory.ChooseChoiceIndex(choiceIdx);
		// Run the Story
		return this.next();
	}
	
	// Run the Ink Story and update the state.
	next() {
		const text = [];
		const tagList = [];	
		
		while (inkStory.canContinue) {
			text.push(inkStory.Continue());
			tagList.push(...inkStory.currentTags);
		}
		const tagState = parseTags(tagList);
		
		return {
			body: text.map(val => html`<p>${val}</p>`),
			choiceList: inkStory.currentChoices,
			tagState: {
				...state.value.tagState,
				...tagState,
			}
		};
	}
}