/**
 * Removes new lines, tabs, and other invisible characters from a string.
 * @param {string} str - The input string.
 * @returns {string} The cleaned string without new lines, tabs, and other invisible characters.
 */
export function removeInvisibleCharacters(str) {
  return str.replace(/(\t\n)/g, '');
}
