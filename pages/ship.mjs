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
			<div class='story-text'>
				Pick a Ship Location to Visit:
			</div>
			<ul class='choice-list'>
				<li class="choice">
					<a>Central Hub</a>
					<img class="mask" src="../imgs/ship/central.png" />
				</li>
				<li class="choice">
					<a>Health and Wellness District</a>
					<img class="mask" src="../imgs/ship/medical.png" />
				</li>
				<li class="choice">
					<a>Research Complex</a>
					<img class="mask" src="../imgs/ship/research.png" />
				</li>
				<li class="choice">
					<a>Residential Districts</a>
					<img class="mask" src="../imgs/ship/residential.png" />
				</li>
				<li class="choice">
					<a>Commercial District</a>
					<img class="mask" src="../imgs/ship/comercal.png" />
				</li>
				<li class="choice">
					<a>Industrial Zone</a>
					<img class="mask" src="../imgs/ship/industral.png" />
				</li>
				<li class="choice">
					<a>Agricultural Zone</a>
					<img class="mask" src="../imgs/ship/agricultural.png" />
				</li>
				<li class="choice">
					<a>Cultural and Arts District</a>
					<img class="mask" src="../imgs/ship/arts.png" />
				</li>
				<li class="choice">
					<a>Outer Decks</a>
					<img class="mask" src="../imgs/ship/outerdecks.png" />
				</li>
			</ul>
		`);	
	})	
}