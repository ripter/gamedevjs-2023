-> start


=== start ===
# background: observation-window.png
# title: Meteor Shower Alert

While on duty in the Outer Decks district, an urgent alert warns of incoming asteroids. These pose a significant threat to the Celestial's hull and vital systems.

Your quick thinking and piloting skills are crucial to navigate this danger.

* Pilot a smaller ship with laser cannons to destroy the asteroids.# DC: 6 # skill: piloting
    -> pilot_ship
    
* Reroute power to the external shields to minimize damage. # DC: 10 # skill: programming
    -> reroute_power
    
* Analyze the asteroid trajectory to find a safer path and adjust the Celestial's course. # DC: 18 #skill: piloting
    -> move_ship

* Coordinate with engineers to deploy repair drones for damage control. # DC: 3 # skill: management
    -> repair_damage



=== pilot_ship ===
You attempt to pilot a ship.
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