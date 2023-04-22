import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { clickToGoBack } from '../utils/clickToGoBack.mjs';
import { ChoiceBasic } from '../components/ChoiceBasic.mjs';

/**
 * Page to show the Ship stats
*/
export async function pageShipStats(selector, backUrl) {
	const elm = document.querySelector(selector);
	const activeIdx = signal(0);
	
	
	
	//
	// Render the page.
	elm.className = 'page page-ship-stats';
	effect(() => {
		const activeItem = allChoices[activeIdx.value];
		
		const handleClick = (item) => {
			// Update the Active/Selected Item.	
			activeIdx.value = allChoices.findIndex(choice => choice.text === item.text);
		}
		
		elm.style.backgroundImage = `url(./imgs/ship/${activeItem.background})`;
		render(elm, html`
			${ChoiceBasic({item: {text: 'Back', name: 'back'}, onClick: clickToGoBack(backUrl), className: 'btn-back'})}
			<dl>
				<dt>${activeItem.text}</dt>
				<dd>${activeItem.description}</dd>

				<dt>Health: ${window.ship.getSystemString(activeItem.system)}</dt>
				<dd>Things effecting the system</dd>
			</dl>
			<ul class='choice-list'>
				${allChoices.map(item => ChoiceBasic({item, onClick: handleClick, className: `${item.text === activeItem.text ? '--active' : ''}`}))}
			</ul>	
		`);
	});
}


const allChoices = [
	{
		text: 'Life Support',
		description: 'The life support system is responsible for maintaining a habitable environment within the ship. It regulates temperature, air pressure, oxygen levels, and carbon dioxide removal, ensuring the health and well-being of the ship\'s inhabitants.',
		background: 'agricultural_zone.png',
		system: 'lifeSupport',
	},
	
	{
		text: 'Propulsion',
		description: 'The propulsion system powers the ship\'s movement through space, allowing for precise navigation, acceleration, and deceleration. This system includes engines, thrusters, and fuel management components, ensuring efficient and reliable travel.',
		background: 'outside.png',
		system: 'propulsion',
	},
	{
		text: 'Power',
		description: 'The power system generates, stores, and distributes energy throughout the ship. This includes the primary energy source, such as a fusion reactor, as well as backup power supplies and energy storage systems, providing a stable and continuous supply of electricity for all ship functions.',
		background: 'outside.png',
		system: 'power',
	},
	{
		text: 'Environmental',
		description: 'The environmental system manages the ship\'s internal climate, water supply, and waste management. This includes air and water filtration, temperature control, humidity regulation, and waste processing, contributing to a comfortable and sustainable living environment.',
		background: 'outside.png',
		system: 'environmental',
	},
	{
		text: 'Communication',
		description: 'The communication system enables the transmission and reception of information both within the ship and externally. This includes internal ship-wide announcements, communication with other vessels or stations, and emergency distress signals, ensuring that vital information is shared and received in a timely manner.',
		background: 'outside.png',
		system: 'communication',
	},
	{
		text: 'Medical',
		description: 'The medical system encompasses the ship\'s healthcare facilities and equipment, enabling the provision of medical care to crew members and passengers. This includes diagnostic tools, surgical equipment, pharmaceuticals, and medical databases, providing comprehensive healthcare services on board.',
		background: 'outside.png',
		system: 'medical',
	},
	{
		text: 'Security',
		description: 'The security system safeguards the ship\'s inhabitants, assets, and information. This includes access control, surveillance, defensive capabilities, and cybersecurity measures, ensuring the safety and integrity of the ship and its occupants.',
		background: 'outside.png',
		system: 'security',
	}
];