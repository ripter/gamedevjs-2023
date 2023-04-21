import { html } from '../libs/uhtml/index.mjs';

/**
 * Basic Choice Component.
 * @params {ChoiceItem} choiceItem
 * @params {(ChoiceItem) => void} onClick
*/
export function ChoiceBasic(choiceItem, onClick) {
	const { text } = choiceItem;
	
	return html.for(choiceItem)`<li class="choice" @click=${() => onClick(choiceItem)}>
		<span class="text">${text}</span>
	</li>`;	
}