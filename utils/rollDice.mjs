/**
 * Basic Dice Roller
*/
export function rollDice(poolCount) {
  let rolls = [];
  for (let i = 0; i < poolCount; i++) {
    rolls.push(Math.floor(Math.random() * 6) + 1);
  }
  return rolls;
}