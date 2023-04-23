import { html } from '../libs/uhtml/index.mjs';

/**
 * Basic Choice Component.
 * @params {ChoiceItem} choiceItem
 * @params {(ChoiceItem) => void} onClick
*/
export function ChoiceBasic(props) {
	const { item, onClick, className = '' } = props;
	const { text } = item;

	return html.for(item)`<li class=${`choice ${className}`} @click=${() => onClick(item)}>
		<span class="text">${text}</span>
	</li>`;
}