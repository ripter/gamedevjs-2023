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
				events: ['maintenance-perfect'],
			};
		});
	}

	getSystemValue(system) {
		const value = this[system].value;
		return `${value}%`;
	}

	getSystemLabel(system) {
		return formatPropName(system);
	}
}
