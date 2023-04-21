import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { formatSkillValue } from '../utils/formatSkillValue.mjs';
import { getSkillDescription } from '../utils/getSkillDescription.mjs';
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
		description: "The Intelligence skill encompasses the ability to learn, reason, and solve complex problems. Those who possess strong Intelligence skills are adept at critical thinking, analysis, and strategic planning. This skill is particularly valuable in professions that require data analysis, research, and innovation.",
	},
	{
		name: "Mechanical",
		description: "The Mechanical skill encompasses the ability to design, build, and maintain mechanical systems, including engines and machinery. Those who possess strong Mechanical skills excel in fields such as robotics, engineering, and maintenance. This skill is particularly valuable in industries that rely on the efficient operation and maintenance of complex machinery.",
	},
	{
		name: "Programming",
		description: "The Programming skill encompasses the ability to create, maintain, and optimize software systems, including those that power artificial intelligence and other advanced technologies found on the Celestial. Those who possess strong Programming skills excel in fields such as software development, data analysis, and digital systems design. This skill is particularly valuable in environments that require the seamless integration of complex systems, the ability to develop and manage advanced AI algorithms, and the agility to adapt to rapidly.",
	},
	{
		name: "Creativity",
		description: "The Creativity skill encompasses the ability to think outside the box, generate new and innovative ideas, and express oneself through art, design, and other creative pursuits. Those who possess strong Creativity skills excel in fields such as graphic design, product development, and entrepreneurship, as well as in research and development roles where innovation is highly valued. This skill is particularly valuable in environments that require the ability to develop unique solutions to complex problems, create engaging user experiences, and foster a culture of innovation.",
	},
	{
		name: "Healthcare",
		description: "The Healthcare skill encompasses the ability to provide medical care, promote health, and prevent illness, including mental health disorders. Those who possess strong Healthcare skills excel in fields such as nursing, medicine, and public health, as well as in roles that involve managing and coordinating healthcare services. This skill is particularly valuable in environments that require the ability to diagnose and treat medical conditions, promote health and wellness, provide compassionate care to patients and their families, and support mental health and emotional well-being.",
	},
	{
		name: "Piloting",
		description: "The Piloting skill encompasses the ability to operate and navigate various types of spacecraft, including those used for exploration, transportation, and military purposes. Those who possess strong Piloting skills excel in fields such as aerospace engineering, commercial aviation, and military aviation, as well as in roles that involve the safe and efficient operation of spacecraft. This skill is particularly valuable in environments that require the ability to navigate complex systems, make quick decisions, and adapt to changing conditions, while ensuring the safety of crew and passengers alike.",
	},
	{
		name: "Agriculture",
		description: "The Agriculture skill encompasses the ability to cultivate crops and manage ecosystems, including hydroponic gardens, air and water production, and nature reserves. Those who possess strong Agriculture skills excel in fields such as agribusiness, conservation, and sustainable farming, as well as in roles that involve managing and protecting natural resources. This skill is particularly valuable in environments that require the ability to produce food and other resources in space-limited conditions, while minimizing waste, promoting sustainability, and ensuring the preservation of ecosystems for future generations.",
	},
	{
		name: "Economics",
		description: "The Economics skill encompasses the ability to understand and manage wealth, markets, and resources. Those who possess strong Economics skills excel in fields such as finance, business management, and government, as well as in roles that involve analyzing and predicting economic trends and their impact on society. This skill is particularly valuable in environments that require the ability to manage resources efficiently, optimize financial performance, and navigate complex market dynamics to achieve strategic goals.",
	},
	{
		name: "Management",
		description: "The Management skill encompasses the ability to plan, coordinate, and oversee various aspects of an organization or project. Those who possess strong Management skills excel in fields such as business administration, project management, and team leadership, as well as in roles that involve managing resources and operations to achieve specific goals. This skill is particularly valuable in environments that require the ability to set priorities, delegate tasks, motivate teams, and adapt to changing circumstances to ensure successful outcomes.",
	}
];


/**
 * Page to show the user's stats and upgrades.
*/
export async function pageYourStats(selector, backUrl, background) {
	const elm = document.querySelector(selector);
	const activeIdx = signal(0);
	
	
	const handleClick = (item) => {
		console.log('clicked', item);
		if (item.name === 'back') {
			// Go back to the previous URL.	
			window.currentPage.value = {
				url: backUrl,
				args: [],
			};
		} else {
			// Update the Active/Selected Item.	
			activeIdx.value = playerChoices.findIndex(choice => choice.name === item.name);
		}
	}
	
	//
	// Render the page.
	elm.className = 'page page-your-stats';
	effect(() => {
		const choices = loadPlayerStats(playerChoices);
		const leftChoiceList = choices.slice(0, 5);
		const rightChoiceList = choices.slice(5);
		const activeItem = choices[activeIdx.value];
		
		elm.style.backgroundImage = `url(./imgs/${background})`;
		render(elm, html`
			${ChoiceBasic({item: {text: 'back', name: 'back'}, onClick: handleClick, className: 'btn-back'})}
			<ul class='choice-list'>
				${leftChoiceList.map(item => ChoiceBasic({item, onClick: handleClick, className: `${item.name === activeItem.name ? '--active' : ''}`}))}
			</ul>	
			<div class="hero">
				<h2>${activeItem.name}</h2>	
				<h3>${`${formatSkillValue(activeItem.name)} - ${getSkillDescription(activeItem.name)}`}</h3>
				<p>
					${activeItem.description}
				</p>
			</div>
			<ul class='choice-list'>
				${rightChoiceList.map(item => ChoiceBasic({item, onClick: handleClick, className: `${item.name === activeItem.name ? '--active' : ''}`}))}
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
		text: `${choice.name} (${formatSkillValue(choice.name)})`,
	}));	
}


