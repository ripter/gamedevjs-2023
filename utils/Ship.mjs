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
				events: new Set(['maintenance-perfect']),
			};
		});
		// Population is also a stat
		this.population = {
			value: 1_000_500,
			envents: new Set(),
		};
		// Zones are locations on the ship.
		this.zones = [
			{ text: 'Agricultural Zone', img: '../imgs/ship/agricultural.png', zone: 'agricultural' },
			{ text: 'Central Hub', img: '../imgs/ship/central.png', zone: 'central' },
			{ text: 'Commercial District', img: '../imgs/ship/comercal.png', zone: 'commercial' },
			{ text: 'Cultural and Arts District', img: '../imgs/ship/arts.png', zone: 'culture' },
			{ text: 'Engine', img: '../imgs/ship/engine.png', zone: 'engine' },
			{ text: 'Health and Wellness District', img: '../imgs/ship/medical.png', zone: 'medical' },
			{ text: 'Industrial Zone', img: '../imgs/ship/industral.png', zone: 'industrial' },
			{ text: 'Outer Decks', img: '../imgs/ship/outerdecks.png', zone: 'decks' },
			{ text: 'Research Complex', img: '../imgs/ship/research.png', zone: 'research' },
			{ text: 'Residential Districts', img: '../imgs/ship/residential.png', zone: 'residential' },
		];
	}

	getSystemValue(system) {
		const value = this[system].value;
		return `${value}%`;
	}

	getSystemLabel(system) {
		return formatPropName(system);
	}
}
