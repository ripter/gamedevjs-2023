import { ChoiceBasic } from '../components/ChoiceBasic.mjs';
import { ChoiceSkillCheck } from '../components/ChoiceSkillCheck.mjs';
import { ChoiceTimeCost } from '../components/ChoiceTimeCost.mjs';

/**
 * Returns a Choice Component by string.
 * Useful so the Ink Story can set the component to use.
*/
export function getChoiceComponent(choiceType) {
	switch (choiceType) {
		case 'skill-check':
			return ChoiceSkillCheck;	
		case 'time-cost':
			return ChoiceTimeCost;
		case 'basic':
		default:
			return ChoiceBasic;
	}
}
