/**
 * Holds data for the Ship
*/
export class Ship {
	constructor() {
		this.name = 'Celestial';
		this.population = 1_000_500;
		this.criticalSystems = [
			'lifeSupport',
			'propulsion',
			'power',
			'environmental',
			'communication',
			'medical',
			'security',
		];	
		// Health as percentage.
		this.criticalSystems.forEach(name => {
			this[name] = 100;
		});
		
	}

	getSystemString(system) {
		const value = this[system];
		console.log('system', value, system, this);
		return `${value}%`;
	}
	
}