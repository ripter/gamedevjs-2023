import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

/**
 * Page Pick a ship location,
*/
export async function pageShip(selector) {
	const elm = document.querySelector(selector);
	const state = signal({});
	
	
	//
	// Render the page.
	elm.className = 'page-ship';
	effect(() => {
		render(elm, html`
			<div class="mask"></div>
			<div class='story-text'>
				Pick a Ship Location to Visit:
			</div>
			<ul class='choice-list'>
				<li>Central Hub</li>
				<li>Health and Wellness District</li>
				<li>Research Complex</li>
				<li>Residential Districts</li>
				<li>Commercial District</li>
				<li>Industrial Zone</li>
				<li>Agricultural Zone</li>
				<li>Cultural and Arts District</li>
				<li>Outer Decks</li>
			</ul>
		`);	
	})	
}