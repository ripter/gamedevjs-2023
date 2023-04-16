 EXTERNAL rollDice()
 
 VAR skill = ""
 VAR currentDiceTotal = 5
 VAR turnsLeft = 3
 VAR isRolling = false



-> start


=== start ===
#background: observation-window.png
#title: Meteor Shower Alert

While on duty in the Outer Decks district, Mother sends out an urgent Alert. A swarm of asteroids have suddenly appeared in the ships flight path. These pose a significant threat to the Celestial's hull and vital systems.

You must act quickly before TIME runs out and the ship is struck. Which team will you join?

    * [Pilot an attack craft and destroy the asteroids with maser cannons. #DC: 6 #skill: piloting]
    -> attack_rocks
    
    * Reroute power to the external shields to minimize damage. # DC: 10 # skill: programming
    -> reroute_power
    
    * Analyze the asteroid trajectory to find a safer path and adjust the Celestial's course. # DC: 18 #skill: piloting
    -> move_ship

    * Coordinate with engineers to deploy repair drones for damage control. # DC: 3 # skill: management
    -> repair_damage




=== attack_rocks ===
#damage: (Big Rock, Critical Systems, Debris)
~ rollDice()

With your Piloting skill, you have {currentDiceTotal} TIME to spend attacking rocks.

    * [Destroy the largest rocks. #cost: 2] 
    -> attack_rocks.break_large_rocks
    
    * [Focus on rocks heading for critical systems #cost: 3]
    -> attack_rocks.protect_critical_systems
    
    
= break_large_rocks
#prevent: Big Rock
#cause: (+1, Debris)
~ currentDiceTotal = currentDiceTotal - 2

You focused your masors on the largest of the asteroid breaking them up into small debris. You prevented {critical|significant|massive} damage to the {Outer Deck|Agricultural Zone|Residential Districts}.

{
- currentDiceTotal > 0:
    + Take another action.
    -> attack_rocks
- else:
    + Return to the Celestial.
    -> END
}

= protect_critical_systems
Use the ship's weapons to target the smaller rocks that are on a collision course with critical ship systems. This will prevent damage to important systems and reduce the risk of critical failure.
-> END


=== pilot_ship ===
VAR dice = ()
~ dice = rollDice()

You roll {dice} for a total of {currentDiceTotal}

{ 
- turnsLeft > 0:
    + {currentDiceTotal >= 6} [Shoot down the asteroids.]
        -> pilot_ship.best_result
    + {currentDiceTotal == 5} [Shoot down the asteroids.]
        -> pilot_ship.decent_result
    + {currentDiceTotal > 1 && currentDiceTotal < 5} [Shoot down the asteroids.]
        -> pilot_ship.ok_result
    + {currentDiceTotal == 1} [Shoot down the asteroids.]
        -> pilot_ship.worst_result
    + [Spend TIME thinking and re-roll.]
        -> pilot_ship
- else:
    + You Ran out of time.
        -> END
}





= best_result
With your exceptional piloting skills, you skillfully navigate the asteroids and take them all down with your laser cannons.
-> END

= worst_result 
Your ship collides with an asteroid, damaging the ship and putting your life in danger.
-> END

= decent_result
You effectively destroy most of the asteroids, but a few manage to slip past your defenses.
-> END

= ok_result
Well at least you tried. It could have been a lot worse.
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