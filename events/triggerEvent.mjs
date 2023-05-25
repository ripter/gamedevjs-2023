
/**
 * Triggers the Event and runs the action.
 * @param {string} code 
 */
export function triggerEvent(code) {
	const { player } = window;
	const event = getAchievement(code);
	if (!event) {
		throw new Error(`Could not find an achievement for the code "${code}"`);
	}
	// Perform the Event Action, pass in the text value for an easier api.
	event.action(event.text);
	// Log the event.
	if (player.eventLog.has(event.code)) {
		player.eventLog.get(event.code).push(player.time);
	} else {
		player.eventLog.set(event.code, [player.time]);
	}
	// Time passes us all by.
	window.player.time += 1;
}

