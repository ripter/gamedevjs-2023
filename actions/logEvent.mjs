
/**
 *  just logs the event, nothing else.
 * @param {string} eventMsg 
 * @param {Player|Ship} who 
 * @param {string} stat 
 */
export function logEvent(eventMsg, who, stat) {
  who[stat].events.push(eventMsg);
}