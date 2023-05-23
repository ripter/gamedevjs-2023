import { parseTags } from './parseTags.mjs';

/**
 * Generator function for the Ink Story
*/
export function* storyGenerator(inkStory, boundFunctions) {
	const tagState = {};

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
			body,
			tags: tagState,
			choiceList: inkStory.currentChoices,
		};
	}
}
