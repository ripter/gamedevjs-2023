
/**
 * Marks a Ship Zone as disabled.
 * @param {string} zoneName 
 */
export function disableZone(zoneName) {
  const zoneOption = window.ship.getZoneOption(zoneName);
  zoneOption.isDisabled = true;
}