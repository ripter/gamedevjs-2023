import { html } from '../libs/uhtml/index.mjs';

/**
 * Choice Component using TD and DD elements.
 * @params {ChoiceItem} choiceItem
 * @params {(number) => void} onClick
*/
export function ChoiceTermDescription(choiceItem, onClick) {
	const { term, description } = choiceItem;
	
	return html.for(choiceItem)`<li class="choice choice-dt" @click=${() => onClick(index)}>
		<dt class="term">${term}<dt>
		<dd class="desc">${description}</dd>
	</li>`;	
}