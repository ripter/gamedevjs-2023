import { html } from '../libs/uhtml/index.mjs';

/**
 * Choice with hover events.
 * @params {ChoiceItem} choiceItem
 * @params {(ChoiceItem) => void} onClick
*/
export function ChoiceHover(choiceItem, onClick, onOver, onOut) {
	const { text } = choiceItem;
	
	return html.for(choiceItem)`<li 
		class="choice choice-image-mask" 
		@click=${() => onClick(choiceItem)} 
		@mouseover=${() => onOver(choiceItem)} 
		@mouseout=${() => onOut(choiceItem)}
		>
		<span class="text">${text}</span>
	</li>`;	
}