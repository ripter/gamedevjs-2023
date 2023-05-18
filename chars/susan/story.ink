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


        

=== year_1_central ===
TODO: Susan Year 1 Central Hub
-> END

=== year_1_decks ===
TODO: Susan Year 1 Outer Decks
-> END

=== year_1_other ===
You picked wrong.
-> END


=== year_1_research_noevent ===
    Nothing else happens for the rest of the year.
-> END

=== year_1_research_mixer ===

You arrive at the Research Lab where the social mixer is being held. The room is buzzing with chatter, and the air is filled with the clinking sound of cocktail glasses. Groups of people cluster around displays of complex machinery and tools, talking animatedly.

+ [Approach a group.] 
    You approach a group of researchers huddled around a holographic model of a molecular structure.
    -> Approach_Group

+ [Mingle with the crowd.] 
    You decide to roam around the room, making small talk and meeting new people.
    -> Mingle_Crowd

+ [Stand at the sidelines and observe.] 
    You find a spot at the side of the room and decide to watch the event from there.
    -> Observe_Sidelines

== Approach_Group
    TODO
-> END

== Mingle_Crowd
    TODO
-> END

== Observe_Sidelines
    TODO
-> END



