/**
 * Events that happen when Susan is in the game.
 */
export const EVENTS = [
	{ code: 'susan_born', 
		text: 'Susan is born!', 
    when: 0.4588, // {year: 156, month: 11, day: 26}
		actions: [],
	},
  { code: 'susan_18',
    text: 'Susan Turns 18! Time to pick a Job',
    when: 0.5700456546446728, // {year: 174, month: 11, day: 26}
  },
];


export const RELATIONSHIPS = {
  'janet': 'known from history logs',
}