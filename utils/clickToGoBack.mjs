
/**
 * Goes back a page.
 */
export function clickToGoBack(backUrl, backArgs = []) {
	return () => {
		window.currentPage.value = {
			url: backUrl,
			args: [...backArgs],
		};
	};
}

