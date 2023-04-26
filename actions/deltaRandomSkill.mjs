import { formatPropName } from '../utils/formatPropName.mjs';

/**
 * Updates a random Player Skill by deltaValue and logs the event.
 * @param {string} eventMsg 
 * @param {number} deltaValue 
 */
export function deltaRandomSkill(eventMsg, deltaValue) {
  const { player } = window;
  const skill = player.getRandomSkill();
  let postFix = formatPropName(skill);
  if (deltaValue > 0) {
    postFix += ` +${deltaValue}`;
  } else {
    postFix += `${deltaValue}`;
  }
  player[skill].value += deltaValue;
  player[skill].events.push(`${eventMsg} [${postFix}]`);
}