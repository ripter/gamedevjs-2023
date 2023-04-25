
export function navigateBack() {
  const currentPage = window.currentPage.value;
  window.currentPage.value = {
    url: currentPage.lastUrl,
    args: [...currentPage.lastArgs],
    lastUrl: null,
    lastArgs: null,
  };
}