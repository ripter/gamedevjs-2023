/**
 * Returns a Click Handler at navigates to the Your Stats Page
*/
export function clickToYourStats(background) {
	const currentPage = window.currentPage.value;
	return () => {
		window.currentPage.value = {
			url: 'yourStats',
			lastUrl: currentPage.url,
			lastArgs: [currentPage.args],
			// Current URL is this page, we want yourStats to be able to come back here when it's done.
			args: [currentPage.url, background], 
		};
	};
}
