import { formatPropName } from './formatPropName.mjs';

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
			this[name] = {
				value: 100,
				events: [],
			};
		});
		
		// // Events are things that has happend to the  over the course of the game
		this.lifeSupport.events = [
			'maintenance-perfect',
		];
		this.power.events = [
			'born',
		]
	}

	getSystemValue(system) {
		const value = this[system].value;
		return `${value}%`;
	}

	getSystemLabel(system) {
		return formatPropName(system);	
	}
	
}