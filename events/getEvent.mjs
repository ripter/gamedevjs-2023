import { EVENTS } from './events.mjs';

/**
 * Returns the Event object with the matching code.
 * @param {string} code - Event Code
 */
export function getEvent(code) {
  return EVENTS.find(event => event.code === code);
}