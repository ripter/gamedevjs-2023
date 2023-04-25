
/**
 * Navigates to a new URL
 * @param {string} url 
 * @param {string[]} args 
 */
export function navigateTo(url, args) {
  const currentPage = window.currentPage.value;
  window.currentPage.value = {
    url,
    args,
    lastUrl: currentPage.url,
    lastArgs: [...(currentPage.args ?? [])],
  };
}