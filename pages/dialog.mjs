import { render, html } from '../libs/uhtml/index.mjs';

/**
 * Page to handle Dialogs
*/
export function pageDialog(selector, storyURL) {
	const elm = document.querySelector(selector);
	elm.className = 'page-dialog';
	
	render(elm, html`
		<p>Dialog Page</p>
	`);	
}