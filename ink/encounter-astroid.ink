EXTERNAL rollDice(skillName)
 
VAR time = -1


-> start


=== start ===
#background: observation-window.png
#title: Meteor Shower Alert
#choiceType: skill-check

While on duty in the Outer Decks district, Mother sends out an urgent Alert. A swarm of asteroids have suddenly appeared in the ships flight path. These pose a significant threat to the Celestial's hull and vital systems.

You must act quickly before TIME runs out and the ship is suffers {significant|massive} damage. Which team will you join?

    * [Pilot an attack craft and destroy the asteroids with maser cannons. #DC: 6 #skill: piloting]
    -> attack_rocks
    
    * Reroute power to the external shields to minimize damage. # DC: 10 # skill: programming
    -> reroute_power
    
    * Analyze the asteroid trajectory to find a safer path and adjust the Celestial's course. # DC: 18 #skill: piloting
    -> move_ship

    * Coordinate with engineers to deploy repair drones for damage control. # DC: 3 # skill: management
    -> repair_damage




=== attack_rocks ===
#choiceType: time-cost
{ time == -1:
    ~ rollDice("piloting")
}


With your Piloting skill, you have {time} TIME to spend attacking rocks.


    * {time >= 2} [Destroy the largest rocks. #cost: 2] 
        -> attack_rocks.break_large_rocks

    * {time >= 3} [Focus on rocks heading for critical systems. #cost: 3]
        -> attack_rocks.protect_critical_systems

    * {time >= 1} [Use your shields to absorb smaller debris. #cost: 1]
    -> attack_rocks.use_shields

    * {time >= 4} [Nudge Large rocks into sweeping clear debris. #cost: 4]
        -> attack_rocks.nudge_rocks
    
    + {time == 0 || CHOICE_COUNT() < 3 } [Return to the Celestial.]
        -> END

        
    
= break_large_rocks
~ time = time - 2

You focused your masors on the largest of the asteroid breaking them up into small debris. You prevented {critical|significant|massive} damage to the {Outer Deck|Agricultural Zone|Residential Districts}.

    + {time > 0} [Take another action.]
        -> attack_rocks
    + Return to the Celestial.
    -> END

= protect_critical_systems
~ time = time - 3
Use the ship's weapons to target the smaller rocks that are on a collision course with critical ship systems. This will prevent damage to important systems and reduce the risk of critical failure.

    + {time > 0} [Take another action.]
        -> attack_rocks
    + Return to the Celestial.
        -> END


= use_shields
~ time = time - 1
You use your attack skip as a ram, letting the smaller debris impact your shields instead of hitting the Celestial hall.

    + {time > 0} [Take another action.]
        -> attack_rocks
    + Return to the Celestial.
        -> END

= nudge_rocks
~ time = time - 4
With persision shooting, you manage the change the directory of several large asteroids. They sweep clear a path of debris before flying safely away from the Celestial.

    + {time > 0} [Take another action.]
        -> attack_rocks
    + Return to the Celestial.
        -> END






=== reroute_power ===
You attempt to reroute power.
-> END

=== move_ship ===
You attempt to change the ship's course.
-> END

=== repair_damage ===
You attempt to repair the damage.
-> END