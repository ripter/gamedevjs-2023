import { loadStory } from '../utils/loadStory.mjs';
import { parseTags } from '../utils/parseTags.mjs';

/**
 * Wrapper around the Ink Story
*/
export class Story {
	constructor() {
		this.inkStory = null;
		this.tagState = {};	
	}
	
	/**
	 * Loads an Ink Story by URL
 	*/
	static async load(url, boundFunctions) {
		const story = new Story();	
		story.inkStory = await loadStory(url);
		
		for (const [key, value] of Object.entries(boundFunctions)) {
			story.inkStory.BindExternalFunction(key, value);
		}
		
		return story;
	}
	
	/**
	 * Returns the Story Variable
	*/
	getVariable(name) {
		const { inkStory } = this;
		return inkStory.variablesState[name];
	}
	/**
	 * Sets a Story Variable
	*/
	setVariable(name, value) {
		const { inkStory } = this;
		inkStory.variablesState[name] = value;
	}
	
	/**
	 * Picks the choice in the story and returns the new state.
	*/
	pickChoice(choiceIdx) {
		const { inkStory } = this;
		// Select the choice
		inkStory.ChooseChoiceIndex(choiceIdx);
		// Run the Story
		return this.next();
	}
	
	// Run the Ink Story and update the state.
	next() {
		const { inkStory, tagState } = this;
		const body = [];
		const tagList = [];	
		
		// Get all the body lines and tags for all of them.	
		while (inkStory.canContinue) {
			body.push(inkStory.Continue());
			tagList.push(...inkStory.currentTags);
		}
		// parse the raw tag text into a tags object.
		const tags = parseTags(tagList);
		
		// Tags persist over the story state. 
		this.tagState = {
			...tagState,
			...tags,
		};
		
		return {
			body,
			tags: this.tagState,
			choiceList: inkStory.currentChoices,
		};
	}
}