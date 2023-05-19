import { PARAM_REGEX } from './consts.mjs';
import { pathToRegex } from './pathToRegex.mjs';

/**
 * Helper function to extract route parameters based on the named placeholders.
 * @param {string} pattern - The path pattern with named placeholders.
 * @param {string} path - The current URL path.
 * @returns {Object} - The extracted route parameters as key-value pairs.
 */
export function extractParams(pattern, path) {
  const paramNames = pattern.match(PARAM_REGEX);
  const regex = pathToRegex(pattern);
  const matches = path.match(regex);
  const params = {};

  if (matches && paramNames) {
    matches.slice(1).forEach((value, index) => {
      const paramName = paramNames[index].slice(1); // Remove the leading ':'
      params[paramName] = value;
    });
  }

  return params;
}