/**
 * Events that can happen to Susan is in the game.
 * code format: charName_year_zoneNmae_tagName_
 */
export const EVENTS = [
	{ code: 'susan_0_residential_born', 
		text: 'Susan is born!', 
    when: 0.4588, // {year: 156, month: 11, day: 26}
		actions: [],
	},
  { code: 'susan_1_residential_turns_18',
    text: 'Susan Turns 18! Time to pick a Job',
    when: 0.5700456546446728, // {year: 174, month: 11, day: 26}
    actions: [],
  },
  {
    code: 'susan_1_research_mixer_meet_samuel',
    text: 'Susan improved her relationship with Dr. Samuel at the Research Lab social mixer.',
    when: -1, // Exact date is unknown until it happens.
    actions: [],
  },
  {
    code: 'susan_1_research_mixer_meet_lily',
    text: 'Susan improved her relationship with Lily at the Research Lab social mixer.',
    when: -1, // Exact date is unknown until it happens.
    actions: [],
  },
  {
    code: 'susan_1_research_mixer_meet_derek',
    text: 'Susan improved her relationship with Derek at the Research Lab social mixer.',
    when: -1, // Exact date is unknown until it happens.
    actions: [],
  },
];


export const RELATIONSHIPS = {
  'janet': 'known from history logs',
  'samuel': 'a senior researcher.',
  'lily': 'a fellow assistant who is cheerful and easygoing.',
  'Derek': 'a fellow assistant who is known for his abrasive attitude and competitive nature',
}