import { Ship } from './ship.mjs';
import { Story } from './story.mjs';

export function initGameState() {

  return {
    state: {
      ship: new Ship(),
      story: new Story(),
    },
    dispatch: () => console.log('Add Dispatch'),
  }
} 