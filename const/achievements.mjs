
export const ACHIEVEMENTS = [
  { code: 'born', text: 'You where born! +1 all skills.' },
  { code: 'astroid-perfect', text: 'You saved the ship from the astroid attack! There was no damage at all! "Mother" says your piloting skills have gone up!' },
  { code: 'maintenance-perfect', text: 'Ship Maintenance - Everything is perfect.' },
];

/**
 * Returns the Achievement by code.
 * @param {string} code 
 * @returns {text: string}
 */
export function getAchievement(code) {
  return ACHIEVEMENTS.find(item => item.code === code);
}