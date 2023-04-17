import { html } from '../libs/uhtml/index.mjs';

/**
 * Basic Choice Component.
 * @params {ChoiceItem} choiceItem
 * @params {(number) => void} onClick
*/
export function ChoiceBasic(choiceItem, onClick) {
	const { text, index } = choiceItem;
	
	return html.for(choiceItem)`<li class="choice" @click=${() => onClick(index)}>
		<span class="text">${text}</span>
	</li>`;	
}