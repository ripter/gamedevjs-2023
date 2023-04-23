
/**
 * Determines the difficulty level of an encounter based on the player's skill level and the encounter's DC.
 *
 * @param {number} playerSkill - The player's skill level (from 1 to 10).
 * @param {number} DC - The difficulty class (DC) of the encounter.
 * @returns {string} The difficulty level as one of the following: 'Guaranteed', 'Easy', 'Moderate', 'Challenging', or 'Impossible'.
 */
 export function determineDifficulty(playerSkill, DC) {
  if (DC <= playerSkill) {
    return 'Guaranteed';
  }
  const maxRoll = playerSkill * 6;
  const probability = (maxRoll - DC + 1) / maxRoll;
  if (DC > maxRoll) {
    return 'Impossible';
  }

  if (probability >= 0.70) {
    return 'Easy';
  } else if (probability >= 0.5) {
    return 'Moderate';
  } else {
    return 'Challenging';
  }
}