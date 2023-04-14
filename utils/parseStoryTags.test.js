import { parseStoryTags } from './parseStoryTags.mjs';

describe('parseStoryTags', () => {
	test('Loads basic tag', () => {
		const tagList = ['background: encounter-astroid.png'];	
		expect(parseStoryTags(tagList)).toEqual({
			background: 'encounter-astroid.png',
		});
	});	
});