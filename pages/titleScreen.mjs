import { render, html } from '../libs/uhtml/index.mjs';
// import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

/**
 * Page that shows the Title Screen.
*/
export function pageTitleScreen(selector, onClick) {
	const elm = document.querySelector(selector);
	elm.className = 'page-title-screen';
	
	render(elm, html`
		<header>
			<h1>Life Aboard the Celestial</h1>
			<h2>A Gamedev.JS Jam 2023</h2>
			<h3>By <a href="https://github.com/ripter">ripter</a></h3>
		</header>
		<footer>
			<button type="button" @click=${() => onClick()}>Start Game</button>	
		</footer>
	`);	
}