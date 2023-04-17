import { html } from '../libs/uhtml/index.mjs';

import { parseTags } from '../utils/parseTags.mjs';
import { determineDifficulty } from '../utils/determineDifficulty.mjs';


/**
 * Skill Check Choice Component.
 * @params {ChoiceItem} choiceItem
 * @params {(number) => void} onClick
*/
export function ChoiceSkillCheck(choiceItem, onClick) {
	const { text, index, tags } = choiceItem;
	const state = parseTags(tags);
	const skillLevel = window.player.skills[state.skill];
	const DC = parseInt(state.DC, 10);
	const difficulty = determineDifficulty(skillLevel, DC);
	
	return html.for(choiceItem)`<li class="choice choice-skill-check" @click=${() => onClick(index)}>
		<span class="text">${text}</span>
		<p class="challenge">(
			<span class="skill">${state.skill}</span>
			-
			<span class=${`difficulty --${difficulty}`}>${difficulty}</span>
		)</p>
	</li>`;	
}