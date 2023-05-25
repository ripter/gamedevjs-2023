import { deltaRandomSkill } from '../actions/deltaRandomSkill.mjs';
import { disableZone } from '../actions/disableZone.mjs';
import { logEvent } from '../actions/logEvent.mjs';

/**
 * Global Events that happen to the Ship/Story.
 * Character Events are added to this list during runtime.
 */
export const EVENTS = [
	{ code: 'earth_signals_about_radiation', 
		text: 'Earth detects a river of Radiation that will hit the ship in the year 327.', 
		when: 0.21162279808283918, // {year: 106, month: 7, day: 13}
		actions: [],
	},
	{ code: 'radiation_hits_ship',
		text: 'A large river of radiation bathes the entire ship for days.',
		when: 327.7230, // {year: 327, month: 8, day: 21}
		actions: [],
	},

	// JAM Events.
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
		deltaRandomSkill(eventMsg, 1);
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
		logEvent(eventMsg, window.player, 'social');
		disableZone('agricultural');
	}},
	{ code: 'meet-alex', text: 'You meet Alex at the holographic display in the Central Hub.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('central');
	}},
	{ code: 'meet-alex-again', text: 'You meet Alex again, this time in the Engine while he performed maintenance.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('engine');
	}},
	{ code: 'meet-alex-first-engine', text: 'You meet Alex in the Engine while he performed maintenance.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('engine');
	}},
	{ code: 'meet-jordan', text: 'You meet Officer Jordan in the Central Hub Communication Center.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('central');
	}},
	{ code: 'visit-central-hub-zone', action: () => disableZone('central')},
	{ code: 'visit-research-zone', action: () => disableZone('research')},
	{ code: 'visit-residential-zone', action: () => disableZone('residential')},
	{ code: 'meet-mia', text: 'You had a lovely conversation with a cheerful barista named Mia.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('commercial');
	}},
	{ code: 'notice-victor', text: 'You notice Victor, a prominent merchant.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('commercial');
	}},
	{ code: 'notice-victor-suspect', text: 'You notice Victor, a sleezy merchant.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
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
	{ code: 'asteroid', text: 'You Played the Asteroid Event.', action: (eventMsg) => {
		// Give a bonus skill for their next play.
		// This is ok because only th astroid encounter exists in the game, so it's just to show what could have been.
		deltaRandomSkill(eventMsg, 1);
	}},
	{ code: 'meet-isabella', text: 'Isabella helped you paint.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('culture');
	}},
	{ code: 'meet-kai', text: 'You watched Kai dance in the street.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('culture');
	}},
	{ code: 'meet-luna', text: 'You had a tête-à-tête with Luna.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('culture');
	}},
	{ code: 'meet-oliver', text: 'You meet photography enthusiast Oliver.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('culture');
	}},
	{ code: 'meet-priya', text: 'You learned about energy efficiency from Priya in the Engine room', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('engine');
	}},
	{ code: 'meet-marcus', text: 'You learned about energy efficiency from Priya in the Engine room', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('engine');
	}},
	{ code: 'meet-sophia', text: 'You talked about engine upgrades with Sophia.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('engine');
	}},
	{ code: 'meet-lila', text: 'You meet the nurse Lila.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('medical');
	}},
	{ code: 'meet-ravi', text: 'You worked out with Ravi.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('medical');
	}},
	{ code: 'meet-greg', text: 'You meet the humble guardian grand manufacturing facility.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('industrial');
	}},
	{ code: 'meet-lena', text: 'You meet master craftswoman of the Celestial, Lena.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('industrial');
	}},
	{ code: 'meet-elara', text: 'Elara, a dedicated keeper of the Celestial\'s inner workings.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('industrial');
	}},	
	{ code: 'meet-julia', text: 'You meet the astronomer Julia.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('decks');
	}},
	{ code: 'meet-samantha', text: 'You meet a cute pilot named Samanth.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('decks');
	}},
	{ code: 'meet-elisa', text: 'You spacewalked with Elisa.', action: (eventMsg) => {
		logEvent(eventMsg, window.player, 'social');
		disableZone('decks');
	}},
];
