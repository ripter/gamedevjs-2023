import { determineDifficulty } from './determineDifficulty.mjs';

describe('determineDifficulty', () => {
	test('difficulty level should be "Guaranteed"', () => {
		let playerSkill = 3;
		let DC = 3;
		expect(determineDifficulty(playerSkill, DC)).toBe('Guaranteed');
	
		playerSkill = 5;
		DC = 4;
		expect(determineDifficulty(playerSkill, DC)).toBe('Guaranteed');
	});
	
	test('difficulty level should be "Easy"', () => {
		let playerSkill = 3;
		let DC = 6;
		expect(determineDifficulty(playerSkill, DC)).toBe('Easy');
	});

	
	test('difficulty level should be "Impossible"', () => {
		let playerSkill = 3;
		let DC = 19;
		expect(determineDifficulty(playerSkill, DC)).toBe('Impossible');
	
		playerSkill = 5;
		DC = 31;
		expect(determineDifficulty(playerSkill, DC)).toBe('Impossible');
	});
	
	
	test('difficulty level should be "Moderate"', () => {
		let playerSkill = 3;
		let DC = 9;
		expect(determineDifficulty(playerSkill, DC)).toBe('Moderate');
	
		playerSkill = 5;
		DC = 14;
		expect(determineDifficulty(playerSkill, DC)).toBe('Moderate');
	});
	
	test('difficulty level should be "Challenging"', () => {
		let playerSkill = 3;
		let DC = 13;
		expect(determineDifficulty(playerSkill, DC)).toBe('Challenging');
	
		playerSkill = 5;
		DC = 25;
		expect(determineDifficulty(playerSkill, DC)).toBe('Challenging');
	});	
});