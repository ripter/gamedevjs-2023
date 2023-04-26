import { render, html } from '../libs/uhtml/index.mjs';

import { navigateTo } from '../utils/navigateTo.mjs';

/**
 * Page that shows the Title Screen.
*/
export function pageTitleScreen(elm, onClick) {
	elm.className = 'page page-title';
	
	render(elm, html`
		<header>
			<h1>Life Aboard the Celestial</h1>
			<h2>A Gamedev.JS Jam 2023</h2>
			<h3>By <a href="https://github.com/ripter/gamedevjs-2023">ripter</a></h3>
		</header>
		<footer>
			<div><button type="button" @click=${() => onClick()}>Start Game</button></div>	
			<div><button type="button" @click=${() => navigateTo('encounter', ['encounter-astroid'])}>Play Astroid Encounter</button></div>
		</footer>
	`);	
}