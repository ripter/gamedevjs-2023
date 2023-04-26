import { render, html } from '../libs/uhtml/index.mjs';
import { signal, effect } from '../libs/usignal.0.9.0.js';

import { ChoiceBasic } from '../components/ChoiceBasic.mjs';
import { formatPropName } from '../utils/formatPropName.mjs';
import { getSkillDescription } from '../utils/getSkillDescription.mjs';
import { navigateBack } from '../utils/navigateBack.mjs';



/**
 * Page to show the user's stats and upgrades.
*/
export async function pageYourStats(elm, background) {
	const activeIdx = signal(0);
	let dispose;
	
	
	// Set Clicked button's item as the active choice.
	const handleClick = (item) => {
		activeIdx.value = allChoices.findIndex(choice => choice.skill === item.skill);
	};
	
	//
	// Render the page.
	elm.className = 'page page-your-stats';
	dispose = effect(() => {
		const { player } = window;
		const choices = allChoices.map(choice => ({
			...choice,
			text: `${formatPropName(choice.skill)} (${player.getSkillValue(choice.skill)})`,
		}));
		const leftChoiceList = choices.slice(0, 5);
		const rightChoiceList = choices.slice(5);
		const activeItem = allChoices[activeIdx.value];
		const playerSkill = player.getSkillValue(activeItem.skill);
		const skillAdj = getSkillDescription(player[activeItem.skill].value);
		const events = player[activeItem.skill].events;
		
		elm.style.backgroundImage = `url(./imgs/${background})`;
		render(elm, html`
			${ChoiceBasic({item: {text: 'Back', name: 'back'}, onClick: () => {dispose(); navigateBack();}, className: 'btn-back'})}
			<h4>TIME: ${player.time}</h4>
			<ul class='choice-list'>
				${leftChoiceList.map(item => ChoiceBasic({item, onClick: handleClick, className: `${item.name === activeItem.name ? '--active' : ''}`}))}
			</ul>	
			<dl class="hero paper">
				<dt>${`${formatPropName(activeItem.skill)}  ${playerSkill}  ${skillAdj}`}</dt>
				<dd>${activeItem.description}</dd>

				${events.length >= 0 && html`<dt>Achievements</dt>`}
				${events.map(event => html`<dd>${event}</dd>`)}
			</dl>
			<ul class='choice-list'>
				${rightChoiceList.map(item => ChoiceBasic({item, onClick: handleClick, className: `${item.name === activeItem.name ? '--active' : ''}`}))}
			</ul>	

		`);	
	});	
}

const allChoices = [
	{
		skill: 'social',
		description: 'The Social skill encompasses the ability to communicate effectively, establish and maintain positive relationships, and navigate social dynamics with ease. Those who possess strong Social skills excel at building rapport, resolving conflicts, and achieving positive outcomes in both personal and professional settings.',
	},
	{
		skill: 'intelligence',
		description: 'The Intelligence skill encompasses the ability to learn, reason, and solve complex problems. Those who possess strong Intelligence skills are adept at critical thinking, analysis, and strategic planning. This skill is particularly valuable in professions that require data analysis, research, and innovation.',
	},
	{
		skill: 'mechanical',
		description: 'The Mechanical skill encompasses the ability to design, build, and maintain mechanical systems, including engines and machinery. Those who possess strong Mechanical skills excel in fields such as robotics, engineering, and maintenance. This skill is particularly valuable in industries that rely on the efficient operation and maintenance of complex machinery.',
	},
	{
		skill: 'programming',
		description: 'The Programming skill encompasses the ability to create, maintain, and optimize software systems, including those that power artificial intelligence and other advanced technologies found on the Celestial. Those who possess strong Programming skills excel in fields such as software development, data analysis, and digital systems design. This skill is particularly valuable in environments that require the seamless integration of complex systems, the ability to develop and manage advanced AI algorithms, and the agility to adapt to rapidly.',
	},
	{
		skill: 'creativity',
		description: 'The Creativity skill encompasses the ability to think outside the box, generate new and innovative ideas, and express oneself through art, design, and other creative pursuits. Those who possess strong Creativity skills excel in fields such as graphic design, product development, and entrepreneurship, as well as in research and development roles where innovation is highly valued. This skill is particularly valuable in environments that require the ability to develop unique solutions to complex problems, create engaging user experiences, and foster a culture of innovation.',
	},
	{
		skill: 'healthcare',
		description: 'The Healthcare skill encompasses the ability to provide medical care, promote health, and prevent illness, including mental health disorders. Those who possess strong Healthcare skills excel in fields such as nursing, medicine, and public health, as well as in roles that involve managing and coordinating healthcare services. This skill is particularly valuable in environments that require the ability to diagnose and treat medical conditions, promote health and wellness, provide compassionate care to patients and their families, and support mental health and emotional well-being.',
	},
	{
		skill: 'piloting',
		description: 'The Piloting skill encompasses the ability to operate and navigate various types of spacecraft, including those used for exploration, transportation, and military purposes. Those who possess strong Piloting skills excel in fields such as aerospace engineering, commercial aviation, and military aviation, as well as in roles that involve the safe and efficient operation of spacecraft. This skill is particularly valuable in environments that require the ability to navigate complex systems, make quick decisions, and adapt to changing conditions, while ensuring the safety of crew and passengers alike.',
	},
	{
		skill: 'agriculture',
		description: 'The Agriculture skill encompasses the ability to cultivate crops and manage ecosystems, including hydroponic gardens, air and water production, and nature reserves. Those who possess strong Agriculture skills excel in fields such as agribusiness, conservation, and sustainable farming, as well as in roles that involve managing and protecting natural resources. This skill is particularly valuable in environments that require the ability to produce food and other resources in space-limited conditions, while minimizing waste, promoting sustainability, and ensuring the preservation of ecosystems for future generations.',
	},
	{
		skill: 'economics',
		description: 'The Economics skill encompasses the ability to understand and manage wealth, markets, and resources. Those who possess strong Economics skills excel in fields such as finance, business management, and government, as well as in roles that involve analyzing and predicting economic trends and their impact on society. This skill is particularly valuable in environments that require the ability to manage resources efficiently, optimize financial performance, and navigate complex market dynamics to achieve strategic goals.',
	},
	{
		skill: 'management',
		description: 'The Management skill encompasses the ability to plan, coordinate, and oversee various aspects of an organization or project. Those who possess strong Management skills excel in fields such as business administration, project management, and team leadership, as well as in roles that involve managing resources and operations to achieve specific goals. This skill is particularly valuable in environments that require the ability to set priorities, delegate tasks, motivate teams, and adapt to changing circumstances to ensure successful outcomes.',
	}
];

