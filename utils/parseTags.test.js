import { parseTags } from './parseTags.mjs';

describe('parseTags', () => {
	test('Loads basic tag', () => {
		const tagList = ['background: encounter-astroid.png'];	
		expect(parseTags(tagList)).toEqual({
			background: 'encounter-astroid.png',
		});
	});	
});