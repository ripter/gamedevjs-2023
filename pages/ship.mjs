import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { ChoiceHover } from '../components/ChoiceHover.mjs';

const links = [
	{text: 'Agricultural Zone', img: '../imgs/ship/agricultural.png'},  
	{text: 'Central Hub', img: '../imgs/ship/central.png'},  
	{text: 'Commercial District', img: '../imgs/ship/comercal.png'},  
	{text: 'Cultural and Arts District', img: '../imgs/ship/arts.png'},  
	{text: 'Engine', img: '../imgs/ship/engine.png'},  
	{text: 'Health and Wellness District', img: '../imgs/ship/medical.png'},  
	{text: 'Industrial Zone', img: '../imgs/ship/industral.png'},  
	{text: 'Outer Decks', img: '../imgs/ship/outerdecks.png'},  
	{text: 'Research Complex', img: '../imgs/ship/research.png'},  
	{text: 'Residential Districts', img: '../imgs/ship/residential.png'},	
	{text: 'Ship Stats', img: null},
	{text: 'Your Stats', img: null},
];

/**
 * Page Pick a ship location,
*/
export async function pageShip(selector) {
	const elm = document.querySelector(selector);
	const state = signal({});
	
	const handleClick = (item) => {
		console.log('clicked', item);
	}
	const handleOver = (item) => {
		state.value = {
			maskURL: item.img,
		}	
	}
	const handleOut = (item) => {
		state.value = {
			maskURL: null,
		}	
	}
	
	//
	// Render the page.
	elm.className = 'page-ship';
	effect(() => {
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
	})	
}