import { Ship } from './ship.mjs';


export function initGameState() {
  const shipState = new Ship();
  // for debugging
  window.ship = shipState;

  return {
    state: {
      ship: shipState,
    },
    dispatch: () => console.log('Add Dispatch'),
  }
} 