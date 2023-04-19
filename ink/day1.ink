-> start

=== start ===
#background: childroom
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

Today, take some time to tour the ship and explore its different areas. This will help you identify where you might like to work in the future. Meet some new people and get to know the ship better. Soon, you will have to choose your daily work assignment, so use today to gather information and make an informed decision.

Enjoy the exploration and make the most of this exciting day.

    


-> END