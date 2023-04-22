
/**
 * Formats a property friendly name into a user friendly version.
 * @param {string} name 
 * @returns {string}
 */
export function formatPropName(name) {
  const words = name.split('_');
  const capitalizedWords = words.map((word) => word.charAt(0).toUpperCase() + word.slice(1));
  return capitalizedWords.join(' ');
}