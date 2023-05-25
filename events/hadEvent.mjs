
/**
 * Returns true when the player has gotten that achivement.
 * @param {string} code 
 */
export function hadEvent(code) {
	const { player } = window;
	if (player.eventLog.has(code)) {
		return player.eventLog.get(code).length;
	} else {
		return 0;
	}
}