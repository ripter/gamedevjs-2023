// How to use:
// Global Vars given to every dialog story.
VAR timePlayer = 0
VAR timeSinceLastRun = 0
VAR totalVisits = 0
// Tags:
// `background`, `npc` set images in the dialog page.
// Functions allow updating the game state and moving onto the next page.
EXTERNAL triggerEvent(code)
EXTERNAL nextPage(url, value)
EXTERNAL completedEvent(code)


-> start

=== start ===
#background: childroom.png
#npc: father

Good morning sleepy head! Today is your graduation day!

    * [Graduation?]
        -> what_is_graduation
    
    * [OMG I can't believe it's finnaly the day!]
        -> excited_for_graduation

    
=== what_is_graduation ===
#npc: mother

Some coffee will help wake you up dear. It's your 18th birthday, and the day the Celestial's AI "Mother" reconizes you as an adult.

    * [Thanks! Coffee sounds great.]
        -> first_day_advice
    * [I'm too excited for coffee, I have things to do!]
        -> first_day_advice


=== excited_for_graduation ===
#npc: father

It's about time, you have so much potential ahead of you. The Celestial's AI "Mother" finnaly reconizes you as an adult.

    * [I'll prove myself to you!]
        -> first_day_advice
    * [What do I do now?]
        -> first_day_advice


=== first_day_advice ===
#npc: mother

As you know, every adult on the Celestial is encouraged to find ways to be helpful around the ship. The AI "Mother" is always available to assist you whenever you need it.

Today, explore the ship. Meet some new people and get to know the ship better. Then tomorrow you can start work.

Enjoy the exploration and make the most of this exciting day. You can always visit me in the Central Hub if you get scared.

    * [Thanks Mom!]
        ~ triggerEvent("mom")
        ~ nextPage("ship", "dialog-intro")
        -> END
    * [Thanks Dad!]
        ~ triggerEvent("dad")
        ~ nextPage("ship", "dialog-intro")
        -> END
    * [Thank You]
        ~ nextPage("ship", "dialog-intro")
        -> END
    * [Leave]
        ~ triggerEvent("thank-no-one")
        ~ nextPage("ship", "dialog-intro")
        -> END


-> END