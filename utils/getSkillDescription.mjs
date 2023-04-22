/**
 * Returns a short description for the skill based on the Player's current level.
 */
export function getSkillDescription(value) {
	switch (value) {
		case 1:
			return "Novice";
		case 2:
			return "Beginner";
		case 3:
			return "Developing";
		case 4:
			return "Improving";
		case 5:
			return "Competent";
		case 6:
			return "Skilled";
		case 7:
			return "Advanced";
		case 8:
			return "Expert";
		case 9:
			return "Masterful";
		case 10:
			return "Legendary";
		default:
			return "Unknown";
	}
}
