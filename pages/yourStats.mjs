import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { ChoiceHover } from '../components/ChoiceHover.mjs';
import { ChoiceBasic } from '../components/ChoiceBasic.mjs';

/*
* Social: Essential for building relationships, resolving conflicts, and achieving favorable outcomes in both personal and professional situations. Crucial in Residential Districts and the Central Hub.
* Critical Thinking: Crucial for making informed decisions and solving problems in the Central Hub, Research Complex, and Health and Wellness District.
* Mechanical: Vital for excelling in professions involving robotics, engineering, and maintenance in the Industrial Zone.
* Programming: Key to thriving in professions involving software development, artificial intelligence, and digital systems in the Research Complex.
* Creativity: Important for artistic and innovative pursuits in the Cultural and Arts District, as well as contributing to the development of new technologies in the Research Complex and designing unique experiences in the Commercial District.
* Healthcare: Necessary for managing physical and emotional health events and maintaining well-being in the Health and Wellness District.
* Piloting: Essential for operating and navigating large and small spacecraft in various space-related activities and professions.
* Agriculture: Important for working with hydroponic gardens, air and water production, and maintaining the nature reserves.
* Economics: Vital for managing wealth, understanding market dynamics, and excelling in commercial and government-related professions in the Commercial District and Central Hub.
* Resource Management: Crucial for optimizing the use of available resources, minimizing waste, and ensuring the sustainability of the Celestial's systems and environment, applicable in various districts such as the Industrial Zone, Nature Reserves, and Agricultural Zone.
*/

const playerChoices = [
	{
		name: "Social",
		description: "The Social skill encompasses the ability to communicate effectively, establish and maintain positive relationships, and navigate social dynamics with ease. Those who possess strong Social skills excel at building rapport, resolving conflicts, and achieving positive outcomes in both personal and professional settings.",
	},
	{
		name: "Intelligence",
		description: "Crucial for making informed decisions, remembering details, and solving problems.",
	},
	{
		name: "Mechanical",
		description: "Vital for robotics, engineering, engines, and maintenance.",
	},
	{
		name: "Programming",
		description: "Key to artificial intelligence, engineering, and digital systems.",
	},
	{
		name: "Creativity",
		description: "Important for artistic and innovative pursuits.",
	},
	{
		name: "Healthcare",
		description: "Necessary for managing physical and emotional health events and maintaining well-being.",
	},
	{
		name: "Piloting",
		description: "Essential for operating spacecraft of all sizes and astrophysics.",
	},
	{
		name: "Agriculture",
		description: "Important for working with hydroponic gardens, air and water production, and maintaining the nature reserves.",
	},
	{
		name: "Economics",
		description: "Vital for managing wealth, understanding market dynamics, and excelling in commercial and government-related trade.",
	},
	{
		name: "Management",
		description: "Crucial for optimizing the use of available resources, minimizing waste, and ensuring the sustainability",
	}
];


/**
 * Page to show the user's stats and upgrades.
*/
export async function pageYourStats(selector) {
	const elm = document.querySelector(selector);
	const activeIdx = signal(0);
	
	
	const handleClick = (item) => {
		console.log('clicked', item);
		activeIdx.value = playerChoices.findIndex(choice => choice.name === item.name);
	}
	const handleOver = (item) => {
		// state.value = {
		// 	maskURL: item.img,
		// }	
	}
	const handleOut = (item) => {
		// state.value = {
		// 	maskURL: null,
		// }	
	}
	
	//
	// Render the page.
	elm.className = 'page-your-stats';
	effect(() => {
		const choices = loadPlayerStats(playerChoices);
		const leftChoiceList = choices.slice(0, 5);
		const rightChoiceList = choices.slice(5);
		const activeItem = choices[activeIdx.value];
		
		render(elm, html`
			<ul class='choice-list'>
				${leftChoiceList.map(item => ChoiceBasic(item, handleClick))}
			</ul>	
			<div class="hero">
				<h2>${activeItem.text}</h2>	
				<p>
					${activeItem.description}
				</p>
			</div>
			<ul class='choice-list'>
				${rightChoiceList.map(item => ChoiceBasic(item, handleClick))}
			</ul>	

		`);	
	})	
}


/**
 * Loads the players's real stats into the choice list.
*/
function loadPlayerStats(choiceList) {
	const { skills } = window.player;
	return choiceList.map(choice => ({
		...choice,
		text: `${choice.name} (${skills[choice.name.toLowerCase()]}/10)`,
	}));	
}