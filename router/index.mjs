import { extractParams } from './extractParams.mjs';
import { pathToRegex } from './pathToRegex.mjs';
import { ROUTES } from './routes.mjs';

/**
 * Router function that handles the routing logic based on the current URL.
 */
export function router() {
  // Get the current URL path
  const path = window.location.pathname;

  // Find the corresponding route based on the current path
  const matchedRoute = findMatchingRoute(path);

  if (matchedRoute) {
    const { page } = matchedRoute;
    const params = extractParams(matchedRoute.path, path);
    // renderComponent(matchedRoute.component, params);
    return page(document.getElementById('gamearea'), params);
  } else {
    renderNotFoundPage();
  }
}

/**
 * Helper function to find the matching route based on the path.
 * @param {string} path - The current URL path.
 * @returns {Object|null} - The matched route object or null if no match is found.
 */
function findMatchingRoute(path) {
  return ROUTES.find(route => {
    const regex = pathToRegex(route.path);
    return regex.test(path);
  });
}



/**
 * Renders the component associated with the route.
 * @param {Function} component - The component constructor function.
 * @param {Object} params - The route parameters to pass to the component.
 */
function renderComponent(component, params) {
  const componentInstance = new component(params);
  // Render the component to the DOM or perform any necessary actions
  // based on your application's needs
}

/**
 * Renders the not found page or handles the route not found scenario.
 */
function renderNotFoundPage() {
  // Render the not found page or handle the route not found scenario
}

// Handle the popstate event
window.addEventListener('popstate', router);

// Update the URL and trigger routing when necessary
function navigateTo(url) {
  history.pushState(null, null, url);
  router();
}

// Example usage: Trigger routing when the user clicks a link
document.addEventListener('click', event => {
  const target = event.target;
  if (target.matches('a[data-link]')) {
    event.preventDefault();
    const url = target.href;
    navigateTo(url);
  }
});

// Initial routing when the page loads
