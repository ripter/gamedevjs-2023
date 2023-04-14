

/**
 * Parses a list of story tags into a state object.
*/
export function parseStoryTags(tagList) {
	const tags = tagList.map(tag => {
		const pair = tag.split(':');	
		return {action: pair[0].trim(), value: pair[1].trim()};
	});
}