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

-> start

=== start ===
#background: ship/decks_zone_2.png

Thanks for Playing! I'm sorry to say that I ran out of time, so there is no more content. I had big plans, but TIME was not my friend. 

If you enjoyed this, please leave some encouraging feedback in the comments. It will help motivate me to complete the game. Otherwise it will end up like all my past games, unfinished.

    * [Play Astroid Encounter]
        -> play_astroid_encounter
        
    * [What was planned?]
        -> planned_features


-> END


=== play_astroid_encounter ===
The Player has 10 skills that can be improved though gameplay. When an event occurs, the player's skill is the number of dice in the player's dice pool. This dice pool is rolled to determin how much TIME the player gets for the event.

Getting a perfect ending in an event results in awards. Otherwise it results in some damage to the ship. THe better you play, the less damage. This damage effects the story and future options.

    * [Launch Encounter]
        ~ nextPage("encounter", "encounter-astroid")
        -> END
    * [Back]
     -> start
-> END


=== planned_features ===
The gameflow would switch between Dialogs and Events. 

The Dialogs provide story that changes based on the path you've taken so far. Each story can read the list of events that has happened to you. This is where the player can explore, gain skill levels, and unlock new story paths.

The Events provide the "gameplay" loop. It features a challenge that requires one of the player's skills to complete. The player must use a limited amount of time to prevent damage to the ship. The player is then rewarded or punished based on performance.

    + [Planned Static Events]
        -> static_events
    + [Dynamic Events]
        -> dynamic_events

    + [Back]
        -> start
-> END


=== static_events ===
These are the Static Events that would have happened regardless of your choices in the game. How they effect you depends on your Skill values and your current location when it occurs.

    * Emergency Power Failure.
        A sudden power failure occurs, affecting multiple critical systems throughout the ship. The player must prioritize which systems to restore first, based on their skills and the potential consequences of leaving certain systems offline for too long.

    * Medical Outbreak.
        A mysterious illness begins to spread throughout the ship, and the player must use their medical knowledge to identify the cause, develop a treatment, and contain the outbreak before it becomes an epidemic.

    * Hostile Boarding.
        The ship is boarded by hostile forces intent on taking control. The player must use their security skills to repel the invaders, protect the passengers and crew, and restore order to the ship.

    * Lost Child.
        A young child goes missing on the ship, and the player must use their investigative and communication skills to find the child and return them safely to their family.

    * Ship-wide Malfunction.
        A series of seemingly unrelated malfunctions plague the ship, affecting the daily lives of its inhabitants. The player must use their technical skills to discover the underlying cause and fix the problem before it escalates.

    * Political Unrest.
        Tensions between different factions on the ship are on the rise, and the player must use their social skills and diplomacy to resolve conflicts and maintain peace.

    * Environmental Crisis.
        A critical issue in the ship's environmental systems threatens the air and water supplies. The player must use their knowledge of the ship's environmental controls to repair the system and prevent a disaster.

    * Star Navigation Challenge.
        The ship encounters an unexpected and dangerous astronomical phenomenon. The player must use their piloting and astronomy skills to navigate the ship safely through the hazard.

    * Sabotage.
        Someone is sabotaging the ship, causing damage to critical systems and endangering the lives of everyone on board. The player must use their investigative skills to find the saboteur and stop them before it's too late.

    * Unplanned Colony.
        A previously uncharted habitable planet is discovered, and the player must use their leadership and decision-making skills to determine if the ship should establish a colony on the planet, which could significantly change the course of the journey and the lives of the inhabitants.
        
    + {CHOICE_COUNT() == 0} [Back]
        -> planned_features

-
    + [Read Another]
        -> static_events
    + [Back]
        -> planned_features
        
=== dynamic_events ===
    Dynamic Events are chance events. The might or might happen during different parts of the game. 
    
    Is started this game jam by creating the Astroid Event first. I spent several days playing around with the mechanics of the event, how the dice are used, the player's options, and other details
    
    Some other Events that might have happened:
    
   
    
    * Power Outage 
        A sudden power fluctuation causes a temporary loss of electricity in a specific area of the ship, creating confusion and requiring maintenance efforts to restore power.
        If location is already damaged, difficultly is increased.

    * Life Support System Malfunction
        A minor issue in the life support system causes a temporary decrease in oxygen levels or air pressure in a particular section of the ship, forcing inhabitants to adapt until the problem is fixed.
        If the player has Agriculture or Mechanical skill, they can help fix the issue, otherwise injures are based on the Management skill.

    * Space Debris Collision
        A small piece of space debris impacts the ship's hull, causing minor damage and requiring repairs.
        If the location has major damage already, the entire section can be lost, including all the people at that location.
        Gameover is possible if the user is at the location when it is lost.

    * Water Leak 
        A minor water leak occurs in one of the hydroponics bays, causing potential damage to crops and requiring immediate attention.
        If the player has Agriculture or Mechanical skill, they can help fix the issue, otherwise water lost is based on the Management skill.

    * Fire Incident 
        A small fire breaks out in a random section of the ship due to an electrical malfunction, forcing the crew to respond quickly and extinguish the flames before they spread.
        If the player is at the location when it happens, they can use Intelligence or Creativity to fight the fire. 
        Otherwise the location is damaged.

    * Medical Emergency 
        A crew member falls ill or gets injured, requiring immediate medical assistance and potentially straining the ship's medical resources.
        The player can help with Healthcare or Social skills.

    * Communications Disruption 
        An unexpected solar flare or other space phenomena causes a temporary disruption in the ship's communication system, making it difficult to send and receive messages.
        Player can bring critical systems back online with Programming or Creativity skills.
        Systems suffer temporary damage that heads with TIME.

    * Security Breach 
        A suspicious individual or group is found on board the Celestial, sparking an investigation and potential security measures to be taken.
        Player can help with Economics or Social skills.
        This event continues if the player does not catch the saboteur. Each time a random location is damaged.

    * Propulsion System Glitch 
        A minor issue in the propulsion system causes the ship to veer slightly off course, requiring a course correction and potential delays in reaching the destination.
        Player can fix the problem with the Piloting skill.

    * Environmental Controls Malfunction 
        A malfunction in the ship's environmental controls causes a section of the ship to experience extreme temperatures or humidity levels, requiring maintenance efforts to resolve the issue and restore comfort.
        Player can fix the issue with the Mechanical skill, or mitigate the damage with the Agriculture or Economics skill.

     + {CHOICE_COUNT() == 0} [Back]
        -> planned_features
        
-
    + [Read Another]
        -> dynamic_events
    + [Back]
        -> planned_features

