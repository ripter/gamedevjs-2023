// How to use:
// Tags on knots are remembered between knots.
// Tags on a Choice only effect that choice.
// Tags:
//  Background sets the Background Image.
//      background: image.jpg
//
// Global Vars given to every dialog story.
VAR playerName = "Subnode 812"
VAR timeLeft = -1
//VAR timePlayer = 0
// Tags:
// `background`, `npc` set images in the dialog page.
//
// Functions allow updating the game state and moving onto the next page.
//EXTERNAL triggerEvent(code)
//EXTERNAL nextPage(url, value)
//EXTERNAL completedEvent(code)

-> start

=== start ===
Which Year?
    * [Year 1 - Research Lab] -> year_1_research
    * [Year 1 - Communications Center, Central Hub] -> year_1_central
    * [Year 1 - Outer Decks] -> year_1_decks
    * [Year 1 - Other] -> year_1_other
    * [Year 2]
        TODO: Add Year 2
    + [DEBUG] -> year_1_research_mixer
    + [Restart] -> start

-
-> END


== year_1_research ==
#background: research_lab_overview
#style: pause_with_click
#music: uplifting
~ timeLeft = RANDOM(2, 4)

In the swirling vortex of scientific pursuit that was the Research Lab, you could find brains so big they had their own gravity. Nestled amongst these knowledge-hungry minds, Susan sat at the epicentre, her fascination for radio hardware acting like a homing signal for anyone lost in the sea of cutting-edge tech.

#background: research_lab_prop_mixer_calendar
Against one wall, a calendar loomed large, each day ticked off with the inevitability of a marching army. One particular date was circled in a red so vibrant it could have been stolen from a firework – the day of the much-anticipated annual Social Mixer. This event was something of a local legend in the Research Lab, an oasis of informality in the desert of intellect, where ideas could be exchanged without the formality of a lab coat.


- (countdown)
#background: research_lab_overview
~ timeLeft = timeLeft - 1
{ timeLeft > -1:
    * [Schedule a meeting with Dr. Samuel at the radio club.]
        #background: radio_club
        #sfx: radio_club
        Susan and Dr. Samuel, both veterans of the radio hardware scene, dive into a conversation as deep and rich as a well-brewed cup of tea. Their shared excitement for the subject is as palpable as static electricity.
        -> countdown
    * [Arrange for drinks with Lily after work.]
        #background: bar
        #sfx: bar
        Lily, a budding researcher who looks to Susan like a parched traveller at a water fountain, joins her for a friendly drink. The air between them hums with anticipation, like the moment before a lightning strike.
        -> countdown
    * [Witness a confrontation between Susan and Derek.]
        #background: hallway
        #sfx: threat
        Susan squares off with Derek, a rival who disagrees with her methods with the intensity of a hurricane. Their debate is a tempest of words and ideas, a cyclone of intellectual challenge.
        -> countdown
    * [Schedule a meeting with her supervisor, Dr. Miller.]
        #background: research_lab_boss_office
        #sfx: worry
        Susan arranges a meeting with Dr. Miller, her boss. It's less of a chat and more of a tactical briefing, providing Susan with a roadmap of the lab's expectations and her own professional growth.
        -> countdown
- else:
    #transition: fadeToBlack
    #sfx: none
    #music: none
     Time, that relentless taskmaster, marches on. The days in the lab pass like sand through an hourglass, each grain a moment of scientific discovery. The Social Mixer, once a distant event on the horizon, is now as imminent as a thunderstorm.
    * [Continue...]
        -> year_1_research_choice
}

== year_1_research_choice ==
#background: bathroom_mirror
#style: dialog

During the routine act of teeth brushing, Susan decides to activate your interface.

"What can I do for you, Susan?" #speaker: ai

"I've been thinking about the Social Mixer. It's like an impending storm on the horizon. Lily's friendly enough, but Derek's like a cloud with a grudge. What do you think?" #speaker: susan

    * [Encourage Susan to brave the Social Mixer.]
        Your digital nudge seems to put some steel in Susan's resolve. After all, a little rain never hurt anyone. And who knows, she might even find a rainbow.
        -> year_1_research_mixer

    * [Suggest that Susan should avoid the storm and focus on her work.]
        Susan mulls over your advice. The idea of weathering the storm in the safety of her work seems to appeal to her. After all, even the biggest storms can't touch you if you're indoors.
        -> year_1_research_noevent


        

=== year_1_research_noevent ===
    Nothing else happens for the rest of the year.
-> END






=== year_1_research_mixer ===
#background: mixer
#style: dialog_alternate
VAR meet_derek = false
VAR meet_lily = false
VAR meet_samuel = false

The Social Mixer, while sounding as enjoyable as a dentist's appointment, is a maelstrom of eclectic minds, ambition, and the peculiar aroma of creativity sprinkled with a smidgen of desperation. It's the sort of environment where ideas zip around like frenzied electrons, and conversations either spark into illuminating thoughts or snuff out misguided theories.

Upon stepping into this intellectual galaxy, Susan finds herself amidst a constellation of personalities. There's Lily, orbiting the refreshments table, her laughter sparkling like a cluster of celestial bodies. Derek, conversely, embodies a brooding nebula in the room's corner, his scowl potent enough to freeze even the most fiery dialogue. And there's Dr. Samuel, holding court near the entrance, his intellectual banter resonating through the room like radio waves from a distant star.

Taking a deep breath, Susan feels a twang of anticipation, akin to the first note struck on a guitar string. The symphony of the Mixer is about to commence, and her role in this cosmic ballet is yet to be choreographed.


Activating the interface, she turns to you.

"Who should I approach first? Any suggestions?" #speaker: susan

-> options


== options
{not meet_lily:
    * {not meet_derek and not meet_samuel} [Propose engaging Lily in conversation.] #speaker: ai
        Lily is a bright star on the cusp of going supernova. A junior researcher in the lab, she appreciates Susan's mentorship and shares a taste for theoretical physics.
        -> lily
        
    * {meet_derek and not meet_samuel} [Remind her that Lily is at the mixer.] #speaker: ai
        Susan agrees with your advice. After the frosty exchange with Derek, a warm conversation might be just what she needs.
        -> lily
        
    * {meet_samuel and not meet_derek} [Suggest that Susan could engage Lily after the intellectual voyage with Samuel.] #speaker: ai
        Perhaps it's time to shift gears from the intellectual voyage with Samuel to mentoring Lily. A smooth transition from one celestial body to another.
        -> lily

    * {meet_samuel and meet_derek} [Propose visiting Lily now that she has engaged with both Derek and Samuel.] #speaker: ai
        With Derek's frostiness and Samuel's intellectual gravity behind her, a chat with Lily might be a refreshing change, like a soft cosmic breeze.
        -> lily
}

{not meet_derek:
    * {not meet_lily and not meet_samuel} [Suggest braving the tempest and approaching Derek.] #speaker: ai
        Derek, a storm in human form, commands respect and trepidation. Beneath his prickly exterior, however, there may be knowledge worth prising free.
        -> derek
        
    * {meet_lily and not meet_samuel} [Suggest getting Derek out of the way next.] #speaker: ai
        Derek might be as approachable as a black hole, but his insight into gravitational waves might be just the thing to ground this space flight.
        -> derek
        
    * {meet_samuel and not meet_lily} [Propose encountering Derek after the stimulating discussion with Samuel.] #speaker: ai
        Having navigated the intellectual swirl with Samuel, perhaps it's time for Susan to brave Derek's icy comet. Even the coldest space rocks have valuable minerals.
        -> derek
    
    * {meet_samuel and meet_lily} [Suggest Susan to approach Derek, being the last one on her list.] #speaker: ai
        With both Lily's radiant energy and Samuel's magnetic intellect in her memory, it might be time for Susan to brave the final frontier: Derek.
        -> derek
}

{not meet_samuel:
    * {not meet_lily and not meet_derek} [Recommend joining Dr. Samuel's conversation.] #speaker: ai
        Dr. Samuel's intellectual charisma is like a beacon in the vast expanse of the lab. Engaging him might be akin to dancing on the edge of a black hole, but the potential insights make it a risk worth taking.
        -> samuel
        
    * {meet_lily and not meet_derek} [Recommend joining Dr. Samuel's conversation.] #speaker: ai
        Dr. Samuel is the lighthouse amidst this nebula of conversation, his intellect is as irresistible as a siren call.
        -> samuel
    
    * {meet_derek and not meet_lily} [Suggest Susan to meet Samuel after the icy encounter with Derek.] #speaker: ai
        Now that Susan has faced Derek's icy demeanor, engaging with Samuel's jovial intellect could be a refreshing change, like a warm solar wind following a cosmic storm.
        -> samuel
    * {meet_derek and meet_lily} [Advise Susan to conclude her social voyage by engaging Dr. Samuel.] #speaker: ai
        Having experienced the icy comet of Derek and the youthful supernova of Lily, it might be time for Susan to navigate towards the steady beacon that is Dr. Samuel, completing her journey through this cosmic event.
        -> samuel
}


* [Advise Susan to enjoy a quiet moment by herself.] #speaker: ai
  In the swirling cosmic dance, there's a comfort in momentarily stepping back. Some clarity might be found in the eye of the storm, offering Susan a fresh perspective.
  -> solitude



== lily
#background: mixer
#npc: lily
~ meet_lily = true

Susan glides through the crowd, moving with the grace of a comet on its journey through the cosmic ballroom, until she reaches Lily, who's engaged in an animated conversation with a group of junior researchers. They're engrossed in a debate about the latest theories on sub-space communication, a topic Susan knows a thing or two about.

Joining the discussion, Susan gently interjects with her insights, her words pouring out like a beautiful nebula of knowledge. The younger researchers listen attentively, their eyes wide with admiration. Lily, in particular, seems captivated by Susan's understanding of the subject.

After the conversation, Susan shares a friendly smile with Lily, their rapport as warm as twin stars orbiting each other in the vast expanse of space.

"Thank you for the help, Susan. You're a natural at this!" Lily enthuses, her eyes shimmering like the milky way.

Lily and Susan activate the interface, turning to you.

"We've got a bit of a debate going on," Lily starts, "and we figured you might be able to settle it. What do you think is the most promising field in radio technology right now?" #speaker: lily

    * [The potential of sub-space communications.]
        "Sub-space communication has the potential to revolutionise long-distance communication, making the universe a smaller place," you suggest, your digital voice brimming with enthusiasm. #speaker: ai
        
        They both seem intrigued by this prospect.
        
        "That's a fascinating concept," Susan muses, "I'll definitely be keeping a closer eye on that area of research." #speaker: susan
        -> lily_next
        
    * [The exploration of radio emissions from distant galaxies.]
        "The exploration of radio emissions from distant galaxies could unlock new understanding of the universe," you propose. 
        
        They both appreciate your insights.
        "That's definitely a field to watch," Lily agrees, nodding along to your words. #speaker: lily
        -> lily_next


== lily_next
Having parted from Lily with the amicability of binary stars, Susan navigates the throng, a solitary spacecraft moving away from the bustling nebula of chatter. She anchors herself in a quieter corner of the cosmos, where the background hum is more like distant stardust than a blazing supernova.

The interface flickers into existence, casting an unearthly glow on Susan's face, giving her the air of an intrepid explorer observing an uncharted celestial body.

"Good heavens! That went off without a hitch. Now, which constellation should we venture to next?" #speaker: susan

-> options



== derek
#background: mixer
#npc: derek
~ meet_derek = true
If the Social Mixer were an asteroid field, then Derek was its rogue comet – known for its unpredictable path and potential for collision. Susan found him leaning against a wall, as if he were somehow holding up the entire spaceship with just his shoulder.

Upon seeing Susan, he raised an eyebrow. The expression seemed to be carved out of ice, matching his icy cold demeanor.

"Ah, Susan. Fancy meeting you here." #speaker: derek

An icy chill, not unlike the cold vacuum of space, seemed to descend upon them. This was an encounter that could make or break the event for Susan. She activated the interface and turned her eyes to it.

"Derek, always one for dramatic entrances. What's your move here?" #speaker: susan

    * [Advise Susan to respond with a polite smile.]
        Following your advice, Susan offers Derek a smile as serene as a calm nebula. His frozen exterior seems to thaw slightly.
        -> derek_next

    * [Suggest Susan to confront Derek directly.]
        Susan takes your advice to heart, facing Derek with all the intensity of a solar flare. His icy demeanor doesn't seem to waver.
        -> derek_next


== derek_next
Their conversation, oscillating between tension and détente, continued against the backdrop of the mixer. There were moments that felt like walking a tightrope across a cosmic abyss, but Susan deftly maintained her balance.

As the interaction winded down, Susan, ready to journey forth, activates the interface, a knowing smile playing at the corners of her lips.

"Well, that was quite the interstellar excursion. Are we ready to initiate the next warp jump?" #speaker: susan

-> options


== samuel
#background: mixer
#npc: samuel
~ meet_samuel = true

As if pulled by an invisible tractor beam, Susan navigates the sea of conversation towards a beacon of familiar intellectual radiance - Dr. Samuel. There he stood, engaged in a discussion about extra-galactic radio sources that would have left less seasoned minds in a state of starstruck stupor.

As Susan neared, the jovial researcher turned to greet her, his eyes twinkling like twin stars.

"Susan! Come join us, we were just discussing the mysteries of the cosmos." #speaker: samuel

Joining their intellectual dance, Susan twirled in with her own thoughts, the complex ideas swirling around like the cosmic dust of a forming galaxy.

After a while, both Susan and Samuel activate the interface, turning to you.

"We seem to have hit a bit of a gravitational anomaly in our discussion. Maybe you can provide a fresh perspective. What do you think about the potential of quasars as an energy source?" #speaker: samuel

    * [Highlight the enormous potential, but also the challenges.]
        "Quasars are some of the most powerful entities in the universe. Harnessing their energy could have extraordinary implications, though the technical challenges would be, to say the least, astronomical." #speaker: ai

        Both Susan and Samuel nod, appreciating the balanced perspective.
        -> samuel_next

    * [Express skepticism about the practicality.]
        "While the potential energy of a quasar is undoubtedly vast, the practical hurdles of harnessing such a power source are quite daunting. It may be more beneficial to focus on more accessible energy solutions." #speaker: ai

        They both seem to consider your point seriously.
        -> samuel_next


== samuel_next
With a friendly farewell to Samuel and the nebula of intellectuals around him, Susan ventures forth, a lone astronaut leaving one celestial body in search of another.

As she finds a quieter asteroid in the noisy cosmos of the social mixer, she activates the interface, her gaze focused and curious.

"That was quite a voyage into the intellectual unknown. Ready to plot the next course?" #speaker: susan

-> options


== solitude
#background: mixer

Feeling the pull of the quiet corners of the social cosmos, Susan decides to take a breather. She activates the interface, relishing a moment of solitude amidst the energetic bustle of the mixer.

The interface, almost intuitively, dims its lights to a soothing hue, mirroring the calm aura of a distant nebula, undisturbed by the frenetic activities of a social event.

"I believe I've earned a moment of peace," Susan murmurs, her voice soft like a cosmic whisper. "Let's enjoy the quiet, shall we?" #speaker: susan

-> END




=== year_1_central ===
TODO: Susan Year 1 Central Hub
-> END

=== year_1_decks ===
TODO: Susan Year 1 Outer Decks
-> END

=== year_1_other ===
You picked wrong.
-> END
