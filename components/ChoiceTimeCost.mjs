import { html } from '../libs/uhtml/index.mjs';

import { parseTags } from '../utils/parseTags.mjs';


/**
 * Time Cost Choice Component.
 * @params {ChoiceItem} choiceItem
 * @params {(number) => void} onClick
*/
export function ChoiceTimeCost(choiceItem, onClick) {
	const { text, index, tags } = choiceItem;
	const { cost = 0 } = parseTags(tags);
	
	
	return html.for(choiceItem)`<li class="choice choice-time-cost" @click=${() => onClick(index)}>
		<p class="text">${text}</p>
		<p class="cost">${cost > 0 ? `(${cost} TIME)` : ''}</p>
	</li>`;	
}