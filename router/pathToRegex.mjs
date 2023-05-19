import { PARAM_REGEX } from './consts.mjs';

/**
 * Helper function to convert path pattern to regex.
 * @param {string} pattern - The path pattern with named placeholders.
 * @returns {RegExp} - The regular expression object for matching the pattern.
 */
export function pathToRegex(pattern) {
  const regexPattern = pattern.replace(PARAM_REGEX, '([^/]+)');
  return new RegExp(`^${regexPattern}$`);
}
