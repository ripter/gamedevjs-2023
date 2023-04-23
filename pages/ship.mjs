import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { ChoiceHover } from '../components/ChoiceHover.mjs';
import { clickToYourStats } from '../utils/clickToYourStats.mjs';
import { clickToShipStats } from '../utils/clickToShipStats.mjs';

const links = [
	{text: 'Agricultural Zone', img: '../imgs/ship/agricultural.png', zone: 'agricultural'},  
	{text: 'Central Hub', img: '../imgs/ship/central.png', zone: 'central'},  
	{text: 'Commercial District', img: '../imgs/ship/comercal.png', zone: 'commercial'},  
	{text: 'Cultural and Arts District', img: '../imgs/ship/arts.png', zone: 'culture'},  
	{text: 'Engine', img: '../imgs/ship/engine.png', zone: 'engine'},  
	{text: 'Health and Wellness District', img: '../imgs/ship/medical.png', zone: 'medical'},  
	{text: 'Industrial Zone', img: '../imgs/ship/industral.png', zone: 'industrial'},  
	{text: 'Outer Decks', img: '../imgs/ship/outerdecks.png', zone: 'decks'},  
	{text: 'Research Complex', img: '../imgs/ship/research.png', zone: 'research'},  
	{text: 'Residential Districts', img: '../imgs/ship/residential.png', zone: 'residential'},	
	{text: 'Your Stats', img: null, nextPage: clickToYourStats('ship/outside.png')},
	{text: 'Ship Stats', img: null, nextPage: clickToShipStats()},
];

/**
 * Page Pick a ship location,
*/
export async function pageShip(elm, nextInk) {
	const state = signal({});
	let dispose;
	
	console.log('nextInk', nextInk);
	// Goto the next page.
	const handleClick = (item) => {
		if (item.nextPage) {
			return item.nextPage();
		}
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
	// elm.style.backgroundImage = '';
	console.log('render ship on elm', elm);
	dispose = effect(() => {
		const { maskURL } = state.value;

		render(elm, html`
			${maskURL && 
				html`<img class="mask" src=${maskURL} />`
			}
			<div class="at-bottom">
				<ul class='choice-list'>
					${links.map(item => ChoiceHover(item, handleClick, handleOver, handleOut))}
				</ul>	
			</div>
		`);	
	});	
}