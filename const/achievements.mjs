import { deltaRandomSkill } from '../actions/deltaRandomSkill.mjs';
import { disableZone } from '../actions/disableZone.mjs';
import { logEvent } from '../actions/logEvent.mjs';

export const ACHIEVEMENTS = [
	{ code: 'born', text: 'You where born! +1 all skills.' },
	{ code: 'astroid-perfect', text: 'You saved the ship from the astroid attack! There was no damage at all! "Mother" says your piloting skills have gone up!' },
	{ code: 'maintenance-perfect', text: 'Ship Maintenance - Everything is perfect.' },
	{ code: 'mom', text: 'You thanked Mom on your 18th birthday.', action: (eventMsg) => {
		deltaRandomSkill(eventMsg, 1);
		// unto the turn add
		window.player.time -= 1;
	}},
	{ code: 'dad', text: 'You thanked Dad on your 18th birthday.', action: (eventMsg) => {
		deltaRandomSkill(eventMsg, 1);
		// unto the turn add
		window.player.time -= 1;
	}},
	{ code: 'thank-no-one', text: 'You gave no thanks on your 18th birthday.', action: (eventMsg) => {
		deltaRandomSkill(eventMsg, 1)
		// unto the turn add
		window.player.time -= 1;
	}},
	{ code: 'meet-riley', text: 'You meet Riley on the farm in the Agricultural Zone', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('agricultural');
	}},
	{ code: 'meet-morgan', text: 'You meet Morgan, a former childhood rival.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('agricultural');
	}},
	{ code: 'meet-riley-flirty', text: 'You meet Riley, a girl you used to like.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'agriculture');
		disableZone('agricultural');
	}},
	{ code: 'meet-alex', text: 'You meet Alex at the holographic display in the Central Hub.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('central');
	}},
	{ code: 'meet-jordan', text: 'You meet Officer Jordan in the Central Hub Communication Center.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('central');
	}},
	{ code: 'visit-central-hub-zone', action: () => disableZone('central')},
	{ code: 'meet-mia', text: 'You had a lovely conversation with a cheerful barista named Mia.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('commercial');
	}},
	{ code: 'notice-victor', text: 'You notice Victor, a prominent merchant.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'economics');
		disableZone('commercial');
	}},
	{ code: 'notice-victor-suspect', text: 'You notice Victor, a prominent merchant.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'economics');
		disableZone('commercial');
	}},
	{ code: 'visit-commercial-zone', action: () => disableZone('commercial')},
	{ code: 'meet-lucy', text: 'You were enchanted by Lucy in the Comerical District', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('commercial');
	}},
	{ code: 'meet-liam', text: 'You meet Lian in this shop.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('commercial');
	}},
	{ code: 'meet-maya', text: 'You watched Maya perform in the streets.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('commercial');
	}},
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
	const { player } = window;
	const event = getAchievement(code);
	if (!event) {
		throw new Error(`Could not find an achievement for the code "${code}"`);
	}
	// Perform the Event Action, pass in the text value for an easier api.
	event.action(event.text);
	// Log the event.
	if (player.eventLog.has(event.code)) {
		player.eventLog.get(event.code).push(player.time);
	} else {
		player.eventLog.set(event.code, [player.time]);
	}
	// Time passes us all by.
	window.player.time += 1;
}