
/**
 * Formats a property friendly name into a user friendly version.
 * @param {string} name 
 * @returns {string}
 */
export function formatPropName(name) {
  return name.map((item) => {
    const words = item.split('_');
    const capitalizedWords = words.map((word) => word.charAt(0).toUpperCase() + word.slice(1));
    return capitalizedWords.join(' ');
  });
}