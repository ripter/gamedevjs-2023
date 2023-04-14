import { parseStoryTags } from './parseStoryTags.mjs';

describe('parseStoryTags', () => {
	test('Loads basic tag', () => {
		const tagList = ['background: encounter-astroid.png'];	
		expect(parseStoryTags(tagList)).toBe({
			background: 'encounter-astroid.png',
		});
	});	
});