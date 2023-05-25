import { Story } from '../libs/ink-es6.js';

/**
 * Loads an Ink Story from URL.
*/
export async function loadStory(url) {
	// fetch the JSON file
	const response = await fetch(url);	
	if (!response.ok) {
		throw new Error(`Failed to fetch story: "${url}"\nError: ${response.statusText}`);
	}
	return new Story(await response.json());
}
