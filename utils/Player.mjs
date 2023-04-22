
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
		this.skills = {
			social: 1,
			intelligence: 2,
			mechanical: 3,
			programming: 4,
			creativity: 5,
			healthcare: 6,
			piloting: 7,
			agriculture: 8,
			economics: 9,	
			management: 10,	
		}

		// Events are things that has happend to the Player over the course of the game
		this.events = [
			'born',
			'astroid-perfect',
		];
	}

	/**
	 * returns a string that represents the current level of proficiency for
	 * @param {string} skillName 
	 * @returns {string} "n/10"
	 */
	getSkillString(skillName) {
		 const value = this.skills[skillName];
		 return `${value}/10`;
	}
}