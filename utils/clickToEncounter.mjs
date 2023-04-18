
/**
 * Returns a Click Handler at navigates to an Encounter Page.
*/
export function clickToEncounter(inkName) {
	return () => {
		window.currentPage.value = {
			url: 'encounter',
			args: [`ink/${inkName}.json`],
		};
	};
}