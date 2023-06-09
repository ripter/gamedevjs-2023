
/**
 * Goes back a page.
 */
export function clickToGoBack() {
	const currentPage = window.currentPage.value;
	return () => {
		window.currentPage.value = {
			url: currentPage.lastUrl,
			args: [...currentPage.lastArgs],
			lastUrl: null,
			lastArgs: null,
		};
	};
}

