import { render, html } from '../libs/uhtml/index.mjs';
import { signal, computed, effect } from '../libs/usignal.0.9.0.js';

export function pageTitleScreen(selector) {
	const elm = document.querySelector(selector);
	const firstName = signal('Chris');
	const lastName = signal('Richards');
	const fullName = computed(() => `${firstName} ${lastName}`);
	
	setTimeout(() => {
		firstName.value = 'Rose';	
	}, 2000);
	
	
	effect(() => render(elm, html`
		<h1>Intro Page</h1>
		<p>${`
			Hello ${fullName.value}
		`}</p>
		What's your name?
		<input type="text" onKeypress=${evt => firstName.value = `${evt.target.value}${evt.key}`} />
	`));	
}