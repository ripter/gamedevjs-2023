/**
 * Returns a Click Handler at navigates to the Ship Stats Page
*/
export function clickToShipStats() {
	return () => {
		window.currentPage.value = {
			url: 'shipStats',
			args: [window.currentPage.value.url], 
		};
	};
}
