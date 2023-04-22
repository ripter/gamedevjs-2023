
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
			intelligence: 1,
			mechanical: 1,
			programming: 1,
			creativity: 1,
			healthcare: 1,
			piloting: 1,
			agriculture: 1,
			economics: 1,	
			management: 1,	
		}
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