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
#background: ship/agricultural_zone.png

You arrive at the lush Agricultural Zone, a vast area filled with greenery, crops, and plant life that sustains the ship's population. The soft hum of the artificial sunlight panels and the sound of water trickling in the hydroponic systems create a soothing atmosphere.

    * [Look at the plants]
        -> admire_plants
        
    * [Checkout the Hydroponics]
        -> hydroponics
        
    * [Measure a sunlight panel output]
        -> sunpanel
    

=== admire_plants ===
#npc: riley

As you admire the vibrant plants, you spot your old friend, Riley, who is tending to a row of vegetables. Riley notices you and waves enthusiastically.

Riley: "Hey there! It's been a while since we last caught up. How have you been?"

    * ["I'm doing well, excited to start this new journey!"]
        Riley smiles warmly. "That's fantastic! We can definitely use your skills and enthusiasm around here."
        

    * [I've been a bit nervous, to be honest.]
        Riley gives you an understanding nod. "It's natural to feel that way, but I'm sure you'll do great. We're here to support each other."
        
        
    * [It's been a bit of a whirlwind, but I'm ready for the challenge.]
        Riley chuckles. "That's the spirit! We'll face these challenges together, my friend."
        

-
Riley: "Anyway, let me show you around. The Agricultural Zone is not only responsible for growing food but also maintaining the ship's oxygen and water recycling systems. There's a lot to learn, but don't worry, I'll guide you through everything."

As you follow Riley, you feel a sense of camaraderie and purpose. With an old friend by your side, you're eager to contribute to the well-being of the Celestial and its inhabitants.

    ~ triggerEvent("meet-riley")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END
   
    * {timePlayer < 2} [Explore another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
    


=== hydroponics ===
#npc: morgan

You make your way to the hydroponics section of the Agricultural Zone, eager to learn more about the advanced techniques used to grow plants in the Celestial. As you examine the intricate system of tubes and trays, you notice a familiar face approaching: your former rival, Morgan.

Morgan: "Well, well, look who's finally decided to join the Agricultural Zone. Didn't think I'd see you here, but I guess life is full of surprises."

    * [Good to see you too, Morgan. I'm just here to learn and contribute.]
        Morgan raises an eyebrow. "Huh, I didn't expect that response. Maybe we can set our rivalry aside and work together."

    * [I'm here to show you that I can excel in this field too.]
        Morgan smirks. "I wouldn't expect anything less from you. Let's see if you can keep up."

    * [Don't worry, Morgan. I won't let our history get in the way of our work.]
        Morgan nods, looking somewhat impressed. "That's very mature of you. We've got a job to do, after all."

-
Morgan: "Alright then, let's see what you've got. I'll be keeping an eye on you, so don't disappoint me."

As Morgan walks away, you feel a mix of excitement and determination. While your past rivalry may linger, you're committed to proving yourself and making a positive impact in the Agricultural Zone and on the Celestial as a whole.

     ~ triggerEvent("meet-morgan")
     
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END
   
    * {timePlayer < 2} [Learn about a different part of the Ship.]
        ~ nextPage("ship", "dialog-intro")
        -> END



=== sunpanel ===
#npc: riley

You find yourself at the Agricultural Zone, admiring the artificial sunlight panels that provide essential light for the plants. Eager to make an impact, you decide to take some measurements to ensure the panels are operating at optimal efficiency.

As you diligently examine the panels, Riley walks over and catches you in the act. With a playful grin, Riley teases you.

Riley: "Well, someone's eager to make a difference! I barely had a chance to say hello before you started measuring the sun panels."

    * [You know me, always ready to dive in!]
        Riley chuckles. "That's what I admire about you. Your enthusiasm is contagious!"

    * [I just wanted to make sure everything's running smoothly.]
        Riley nods appreciatively. "Your attention to detail is really valuable around here."

    * [I couldn't help myself. I'm fascinated by these panels!]
        Riley's eyes light up. "I'm glad you're so interested! There's a lot to learn, and I'd be happy to teach you more."

-
Riley: "Once you've finished up here, come find me, and we can catch up. It's great to have you on board, and I'm looking forward to working together!"

As Riley walks away, you feel motivated by their playful encouragement. Your diligence and enthusiasm are bound to make a positive impact on the Agricultural Zone and the Celestial as a whole.

    ~ triggerEvent("meet-riley-flirty")
     
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END
    * {timePlayer < 2} [Look for more friends around the ship.]
        ~ nextPage("ship", "dialog-intro")
        -> END
