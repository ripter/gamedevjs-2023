/**
 * Returns a Click Handler at navigates to the Your Stats Page
*/
export function clickToYourStats(background) {
	return () => {
		window.currentPage.value = {
			url: 'yourStats',
			// Current URL is this page, we want yourStats to be able to come back here when it's done.
			args: [window.currentPage.value.url, background], 
		};
	};
}
