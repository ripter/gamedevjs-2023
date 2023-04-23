import { html } from '../libs/uhtml/index.mjs';

/**
 * Choice with hover events.
 * @params {ChoiceItem} choiceItem
 * @params {(ChoiceItem) => void} onClick
*/
export function ChoiceHover(props) {
	const { item, onClick, onOver, onOut, className = '' } = props;
	const { text } = item;
	
	return html.for(item)`<li 
		class=${`choice choice-image-mask ${className}`} 
		@click=${() => onClick(item)} 
		@mouseover=${() => onOver(item)} 
		@mouseout=${() => onOut(item)}
		>
		<span class="text">${text}</span>
	</li>`;	
}