
/**
 * Updates the class list of the body element based on the current screen size and orientation.
 * The function will assign one of the following classes for screen size: "iphone", "ipad", or "desktop",
 * and one of the following classes for orientation: "portrait" or "landscape".
 *
 * @function
 */
function updateClasses() {
  const body = document.body;
  body.className = '';  // clear current classes

  const width = window.innerWidth;
  const height = window.innerHeight;
  const minSize = Math.min(width, height);

  if (minSize <= 551) {
    body.classList.add('iphone');
  } else if (minSize <= 1024) {
    body.classList.add('ipad');
  } else {
    body.classList.add('desktop');
  }

  if (height > width) {
    body.classList.add('portrait');
  } else {
    body.classList.add('landscape');
  }
}

// Call it once initially
updateClasses();
// Update classes when window size changes
window.addEventListener('resize', updateClasses);
// Update classes when device orientation changes
window.addEventListener('orientationchange', updateClasses);