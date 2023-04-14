

/**
 * Parses a list of story tags into a state object.
*/
export function parseStoryTags(tagList) {
	return tagList
		.map(tag => tag.split(':'))
		.reduce((acc, pair) => {
			const key = pair[0].trim();
			const value = pair[1].trim();
			acc[key] = value;
			return acc;	
		}, {});
}