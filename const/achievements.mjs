import { deltaRandomSkill } from '../actions/deltaRandomSkill.mjs';

export const ACHIEVEMENTS = [
	{ code: 'born', text: 'You where born! +1 all skills.' },
	{ code: 'astroid-perfect', text: 'You saved the ship from the astroid attack! There was no damage at all! "Mother" says your piloting skills have gone up!' },
	{ code: 'maintenance-perfect', text: 'Ship Maintenance - Everything is perfect.' },
	{ code: 'mom', text: 'You thanked Mom on your 18th birthday.', action: (eventMsg) => deltaRandomSkill(eventMsg, 1)},
	{ code: 'dad', text: 'You thanked Dad on your 18th birthday.', action: (eventMsg) => deltaRandomSkill(eventMsg, 1)},
	{ code: 'thank-no-one', text: 'You gave no thanks on your 18th birthday.', action: (eventMsg) => deltaRandomSkill(eventMsg, 1)},
];

/**
 * Returns the Achievement by code.
 * @param {string} code 
 * @returns {text: string}
 */
export function getAchievement(code) {
	return ACHIEVEMENTS.find(item => item.code === code);
}

/**
 * Triggers the Achievement and runs the action.
 * @param {string} code 
 */
export function triggerAchievement(code) {
	const event = getAchievement(code);
	if (!event) {
		throw new Error(`Could not find an achievement for the code "${code}"`);
	}
	event.action(event.text);
}