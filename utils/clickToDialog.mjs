/**
 * Returns a Click Handler at navigates to a Dialog Page.
*/
export function clickToDialog(inkName) {
	return () => {
		window.currentPage.value = {
			url: 'dialog',
			args: [`ink/${inkName}.json`],
		};
	};
}