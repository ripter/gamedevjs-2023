import { getRandomItemFromArray } from '../utils/getRandomItemFromArray.mjs';
import { getAchievement } from '../const/achievements.mjs';

/**
 * Holds all of the Player data.
*/
export class Player {
	constructor() {
		// TIME is the "turn number" or "life" of the Player. Time is always moving forward.
		// anytime `triggerAchievement` is called, the player's TIME goes up.
		this.time = 0;
		// Happiness is the the player's "score" in the game.
		this.happiness = 100;
		// Health is a percent, 100 is perfect health.
		this.health = 100;
		// All Skills Start at 1
		// Skills are the user's dice pool used in encounters.
		this.skills = [
			'social',
			'intelligence',
			'mechanical',
			'programming',
			'creativity',
			'healthcare',
			'piloting',
			'agriculture',
			'economics',	
			'management',	
		];
		// pre-fill all the skill values.
		this.skills.forEach(skill => {
			this[skill] = {
				value: 1,
				events: [],
			};
		});
		
		// Keep a log of all events that have happened.
		this.eventLog = new Map();

		// Events are things that has happend to the Player over the course of the game
		this.healthcare.events = [
			getAchievement('born').text,
		];
	}

	/**
	 * returns a string that represents the current level of proficiency for
	 * @param {string} skillName 
	 * @returns {string} "n/10"
	 */
	getSkillValue(skillName) {
		const { value = 0 } = this[skillName];
		return `${value}/10`;
	}

	getRandomSkill() {
  	return getRandomItemFromArray(this.skills);
	}
}