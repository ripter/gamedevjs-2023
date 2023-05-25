import { parseTags } from './parseTags.mjs';
import { removeInvisibleCharacters } from '../utils/removeInvisibleCharacters.mjs';

/**
 * Generator function for the Ink Story
 * @param {InkStory} inkStory - An Ink Story Object.
 * @param {{name: func}} boundFunctions - Object of function names and functions. Will be passed into the Ink Story.
*/
export function* storyGenerator(inkStory, boundFunctions) {
	let tagState = {};

	for (const [key, value] of Object.entries(boundFunctions)) {
		inkStory.BindExternalFunction(key, value);
	}

	while (inkStory.canContinue) {
		const body = inkStory.Continue();
		const tagList = inkStory.currentTags;
		const tags = parseTags(tagList);

		tagState = {
			...tagState,
			...tags,
		};

		yield {
			body: body.replace(/\n/, ''),
			tags: tagState,
			choiceList: inkStory.currentChoices,
		};
	}
}
