
/**
 * Holds all of the Player data.
*/
export class Player {
	constructor() {
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

		this.skills.forEach(skill => {
			this[skill] = {
				value: 1,
				events: [],
			};
		});

		// Events are things that has happend to the Player over the course of the game
		this.healthcare.events = [
			'born',
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
}