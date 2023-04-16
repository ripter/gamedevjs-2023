 EXTERNAL rollDice()
 
 VAR skill = ""
 VAR currentDiceTotal = 5
 VAR turnsLeft = 3
 VAR isRolling = false



-> start


=== start ===
# background: observation-window.png
# title: Meteor Shower Alert

While on duty in the Outer Decks district, an urgent alert warns of incoming asteroids. These pose a significant threat to the Celestial's hull and vital systems.

Your quick thinking and piloting skills are crucial to navigate this danger.

* Pilot a smaller ship with laser cannons to destroy the asteroids. # DC: 6 # skill: piloting
    -> pilot_ship
    
* Reroute power to the external shields to minimize damage. # DC: 10 # skill: programming
    -> reroute_power
    
* Analyze the asteroid trajectory to find a safer path and adjust the Celestial's course. # DC: 18 #skill: piloting
    -> move_ship

* Coordinate with engineers to deploy repair drones for damage control. # DC: 3 # skill: management
    -> repair_damage



=== pilot_ship ===
VAR dice = ()
~ dice = rollDice()

You roll {dice} for a total of {currentDiceTotal}

{ 
- turnsLeft > 0:
    + {currentDiceTotal >= 6} With your exceptional piloting skills, you skillfully navigate the asteroids and take them all down with your laser cannons.
        -> pilot_ship.best_result
    + {currentDiceTotal >= 5} You effectively destroy most of the asteroids, but a few manage to slip past your defenses.
        -> pilot_ship.decent_result
    + {currentDiceTotal >= 1} Your ship collides with an asteroid, damaging the ship and putting your life in danger.
        -> pilot_ship.worst_result
    + Spend TIME thinking and re-roll.
        -> pilot_ship
- else:
    + You Ran out of time.
        -> END
}





= best_result
You are perfect, amazing job.
-> END

= worst_result 
You suck, worst possible result.
-> END

= decent_result
No the best but you avoided the worst of the damage.
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