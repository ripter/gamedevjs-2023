import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { ChoiceHover } from '../components/ChoiceHover.mjs';
import { clickToYourStats } from '../utils/clickToYourStats.mjs';
import { clickToShipStats } from '../utils/clickToShipStats.mjs';

/**
 * Page Pick a ship location,
*/
export async function pageShip(elm, nextInk) {
	const state = signal({});

	// Add the Stat pages to the skip zone list.
	const links = [ ...window.ship.zones,
		{text: 'Your Stats', img: null, nextPage: clickToYourStats('ship/outside.png')},
		{text: 'Ship Stats', img: null, nextPage: clickToShipStats()},
	];
	
	// Goto the next page.
	const handleClick = (item) => {
		// if there is a nextPage function, use that.
		if (item.nextPage) {
			return item.nextPage();
		}
		// else, load a dialog page with the ink-zone
		window.currentPage.value = {
			url: 'dialog',
			args: [`ink/${nextInk}-${item.zone}.json`],
		};
	};
	// Add the mask on over
	const handleOver = (item) => {
		state.value = {
			maskURL: item.img,
		};	
	};
	// Remove the mask on out.
	const handleOut = () => {
		state.value = {
			maskURL: null,
		};	
	};
	
	//
	// Render the page.
	elm.className = 'page page-ship';
	elm.removeAttribute('style');
	effect(() => {
		const { maskURL } = state.value;

		render(elm, html`
			${maskURL && 
				html`<img class="mask" src=${maskURL} />`
			}
			<div class="at-bottom">
				<ul class='choice-list'>
					${links.map(item => ChoiceHover({
						item, 
						onClick:handleClick, 
						onOver:handleOver, 
						onOut:handleOut
					}))}
				</ul>	
			</div>
		`);	
	});	
}