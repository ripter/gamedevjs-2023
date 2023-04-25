EXTERNAL rollDice(skillName)
EXTERNAL triggerEvent(code)
EXTERNAL nextPage(url, value)

EXTERNAL updateShip(propName, deltaValue)
EXTERNAL updatePlayer(propName, deltaValue)
EXTERNAL onGameOver()

VAR time = -1
VAR largeRocks = 0
VAR criticalRisk = 0
VAR hasDebris = false


-> start


=== start ===
#background: observation-window.png
#title: Meteor Shower Alert
#choiceType: skill-check
~ largeRocks = RANDOM(1, 2)
~ criticalRisk = RANDOM(1, 3)
~ hasDebris = true

A swarm of asteroids suddenly appears in the Celestial's flight path, posing a threat to the ship's hull and vital systems. Mother sends an urgent Alert.

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
{
-TURNS_SINCE(-> attack_rocks) == 0:
 "Mother" has detected a concerning situation. There are {largeRocks} {large|massive|huge|gigantic|colossal} {rocks|asteroids|boulders} present, as well as a {criticalRisk} of smaller rocks and scattered debris that could cause {significant|enormous|devastating|catastrophic} damage to the Celestial's hull and vital systems.
 
 -else:
    {
    - time >= 2 && largeRocks > 0:
        There are still {largeRocks} {large|massive|huge|gigantic|colossal} {rocks|asteroids|boulders}. <>
    - time < 2 && largeRocks > 0:
        You don't have enough time to handle the remaining {largeRocks} {large|massive|huge|gigantic|colossal} {rocks|asteroids|boulders}. <>
    }
    {
    - time >= 3 && criticalRisk > 0:
        {criticalRisk} smaller rocks have trajectory that will {impact|collide} with critical Celestial systems. <>
    - time < 3 && criticalRisk > 0:
        You don't have though time to prevent {criticalRisk} critical systems from being damaged by the smaller {asteroids|rocks}. <>
    }
    {hasDebris:
        There is {wide spread|large amount} of debris that will penitrate the shields and cause widespred minor damage. <>
    }
}
    
With your Piloting skill, you have {time} TIME to spend attacking rocks.


    + {time >= 2 && largeRocks > 0} [Destroy the largest rocks. #cost: 2] 
        -> attack_rocks.break_large_rocks

    + {time >= 3 && criticalRisk > 0} [Focus on rocks heading for critical systems. #cost: 3]
        -> attack_rocks.protect_critical_systems

    + {time >= 1 && hasDebris} [Use your shields to absorb smaller debris. #cost: 1]
    -> attack_rocks.use_shields

    + {time >= 4 && largeRocks > 0 && hasDebris} [Nudge Large rocks into sweeping clear debris. #cost: 4]
        -> attack_rocks.nudge_rocks
    
    + {largeRocks <= 0 && criticalRisk <= 0 && not hasDebris} [All threats have been delt with, return to the Celestial.]
        -> end_result
    + {time == 0 || CHOICE_COUNT() < 3 } [Return to the Celestial.]
        -> end_result

        
    
= break_large_rocks
~ time = time - 2
~ largeRocks = largeRocks - RANDOM(1, 2)

You focused your masors on the largest of the asteroid breaking them up into small debris. You prevented {critical|significant|massive} damage to the {Outer Deck|Agricultural Zone|Residential Districts}.
{largeRocks > 0:
    There are still {largeRocks} {large|massive} rocks headed for the ship.
}

    + {time > 0} [Take another action.]
        -> attack_rocks
    + [Return to the Celestial.]
    -> end_result


= protect_critical_systems
~ time = time - 3
~ criticalRisk = 0
Use your ship's weapons to target the smaller rocks that are on a collision course with critical ship systems. This will prevent damage to important systems and reduce the risk of critical failure.

    + {time > 0} [Take another action.]
        -> attack_rocks
    + [Return to the Celestial.]
        -> end_result


= use_shields
~ time = time - 1
~ hasDebris = false
You use your attack skip as a ram, letting the smaller debris impact your shields instead of hitting the Celestial hall.

    + {time > 0} [Take another action.]
        -> attack_rocks
    + [Return to the Celestial.]
        -> end_result

= nudge_rocks
~ time = time - 4
~ temp rocksDestroyed = RANDOM(1, 2)
~ temp criticalSaved = RANDOM(1, 2)
~ hasDebris = false
~ largeRocks = largeRocks - rocksDestroyed
~ criticalRisk = criticalRisk - criticalSaved

With persision shooting, you manage the change the directory of {rocksDestroyed} large asteroids. They sweep clear a path of debris and even took out {criticalSaved} rocks headed for critical ship systems before flying safely away from the Celestial.

    + {time > 0} [Take another action.]
        -> attack_rocks
    + [Return to the Celestial.]
        -> end_result






=== reroute_power ===
You attempt to reroute power.
-> END

=== move_ship ===
You attempt to change the ship's course.
-> END

=== repair_damage ===
You attempt to repair the damage.
-> END


=== end_result ===
#title: Summary
{largeRocks > 0:
    {largeRocks} Areas of the ship damaged by the Large Rocks.
}
{criticalRisk > 0:
    {criticalRisk} Critical Systems damaged by the astroids.
}
{hasDebris:
    Minor damage across several areas from the debris.
}

+ Return
    ~ onGameOver()
-> END