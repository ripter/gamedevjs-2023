import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { ChoiceHover } from '../components/ChoiceHover.mjs';
import { navigateTo } from '../utils/navigateTo.mjs';


/**
 * Page Pick a ship location,
*/
export async function pageShip(elm, nextInk) {
	const state = signal({});

	// Add the Stat pages to the skip zone list.
	const STATIC_OPTIONS = [
		{ text: 'Your Stats', img: null, nextPage: () => navigateTo('yourStats', ['ship/outside.png']) },
		{ text: 'Ship Stats', img: null, nextPage: () => navigateTo('shipStats', []) },
	];
	
	// Goto the next page.
	const handleClick = (item) => {
		// ignore disabled clicks.
		if (item.isDisabled) {
			return;
		}
		// if there is a nextPage function, use that.
		if (item.nextPage) {
			return item.nextPage();
		}
		// else, load a dialog page with the ink-zone
		window.currentPage.value = {
			url: 'dialog',
			args: [`${nextInk}-${item.zone}`],
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
	// elm.removeAttribute('style');
	effect(() => {
		const { maskURL } = state.value;
		
		// Add the Stat pages to the skip zone list.
		const links = [
			...window.ship.zones,
			...STATIC_OPTIONS,
		];

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
						onOut:handleOut,
						className: item.isDisabled ? '--disabled' : '',
					}))}
				</ul>	
			</div>
		`);	
	});	
}