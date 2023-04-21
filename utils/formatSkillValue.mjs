/**
 * Formats the skill value out of 10.
 * Uses the Player's current skill value.
*/
export function formatSkillValue(skillName) {
	const { skills } = window.player;
	const skill = skillName.toLowerCase();
	const value = skills[skill];
	
	return `${value}/10`;
}