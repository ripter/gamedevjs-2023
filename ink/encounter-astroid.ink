EXTERNAL rollDice(skillName)
EXTERNAL triggerEvent(code)
EXTERNAL nextPage(url, value)
EXTERNAL getSkillValue(skillName)

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
    
    * [Reroute power to the external shields or laser defence. # DC: 10 # skill: programming]
    -> reroute_power
    
    * [Analyze the asteroid trajectory to find a safer path and adjust the Celestial's course. # DC: 18 #skill: piloting]
    -> move_ship

    * [Coordinate with engineers to deploy repair drones for damage control. # DC: 3 # skill: management]
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
#choiceType: time-cost
~ temp skillValue = getSkillValue("programming")
{ time == -1:
    ~ temp diceResult = rollDice("programming")
}
With your Programming skill of {skillValue}, you rolled {skillValue} 6 sided dice. ({diceResult}) That gives you {time} TIME to spend on actions.

The Celestial's onboard computer suddenly detects an incoming wave of space debris, posing a serious threat to the ship's safety. As a skilled programmer, you realize that you must act quickly to protect the vessel and its inhabitants. Each action you take consumes valuable TIME, and the average amount of time for a programming action is 5-7 TIME units. Use your programming skills wisely to deal with the impending danger.

    * {time >= 5} [Reroute power to the external shields. #cost: 5]
        -> external_shields

    * {time >= 6} [Activate the laser defense system to target incoming debris. #cost: 6]
        -> laser_defense

    * {time >= 7} [Upgrade the ship's sensor array to predict debris trajectory. #cost: 7]
        -> sensor_array
        

    * {time >= 14} [Combine all actions to reinforce external shields, activate the laser defense system, and upgrade the sensor array. #cost: 14]
        -> combined_upgrades
        
    * {time < 5} [There is nothing more you can do in {time} TIME]
        -> end_result


= external_shields
~ time = time - 5
~ criticalRisk = 0
You quickly access the ship's power management system and work on rerouting power to the external shields. Depending on your programming skill level, you efficiently divert energy to the shields, reinforcing them to withstand the impact of the incoming debris. As you complete the rerouting, 5 TIME units are spent, but the Celestial's defenses are significantly bolstered.

    + {time > 5} [Take another action.]
        -> reroute_power
    + [End Event Participation]
        -> end_result



= laser_defense
~ time = time - 6
~ largeRocks = 0
You rush to the weapons control panel and begin programming the laser defense system to automatically target and destroy the incoming debris. Your programming skill level dictates the system's efficiency, and after spending 6 TIME units, you successfully create a protective barrier of lasers, obliterating any debris that comes too close.

    + {time > 4} [Take another action.]
        -> reroute_power
    + [End Event Participation]
        -> end_result


= sensor_array
~ time = time - 7
~ hasDebris = false
You decide to upgrade the ship's sensor array, aiming to accurately predict the trajectory of the space debris. Depending on your programming skill level, you spend 7 TIME units enhancing the sensors, enabling the Celestial to better anticipate and avoid potential collisions.

    + {time > 4} [Take another action.]
        -> reroute_power
    + [End Event Participation]
        -> end_result


= combined_upgrades
~ time = time - 14
Fueled by a sense of urgency, you decide to combine all three actions. You reroute power to the external shields, activate the laser defense system, and upgrade the sensor array. The operation is time-consuming, requiring 18 TIME units, but with your programming skills, the Celestial successfully weathers the storm of space debris, remaining unscathed and on course.

    + {time > 4} [Take another action.]
        -> reroute_power
    + [End Event Participation]
        -> end_result







=== move_ship ===
#choiceType: time-cost
~ temp skillValue = getSkillValue("piloting")
{ time == -1:
    ~ temp diceResult = rollDice("piloting")
}
With your Piloting skill of {skillValue}, you rolled {skillValue} 6 sided dice. ({diceResult}) That gives you {time} TIME to spend on actions.

As you detect the incoming wave of space debris and asteroids, you realize that the safest course of action is to carefully analyze their trajectories and find a safer path for the Celestial. Your piloting skills will be put to the test as you try to navigate the ship through this treacherous stretch of space. Use your piloting skills wisely to maneuver the ship away from danger.

    * {time >= 14} [Perform an analysis of the asteroid trajectories. #cost: 14]
        -> analyis_trajectories
    
    * {time >= 7} [Implement evasive maneuvers to dodge incoming asteroids. #cost: 7]
        -> ship_evasive_maneuvers
   
    * {time >= 20} [Utilize Mythic skill level powers to create a comprehensive strategy, saving the Celestial from the incoming debris. #cost: 20]
        -> mythic_powers
        
    + {time < 7} [There is noting you can do here in {time} TIME.]
        -> end_result


= analyis_trajectories
~ time = time - 14
~ largeRocks = 0
~ hasDebris = false

   You swiftly gather data from the ship's sensors and perform a rapid analysis of the asteroid trajectories. You manage to identify a relatively safer path through the debris field. 
   You adjust the Celestial's course, minimizing the risk of collision.

    + {time > 7} [Take another action.]
        -> move_ship
    + [End Event Participation]
        -> end_result



= ship_evasive_maneuvers
~ time = time - 7
~ criticalRisk = 0

Realizing that the situation requires immediate action, you opt to use evasive maneuvers to dodge the incoming asteroids. Depending on your piloting skill level, you spend 7 TIME units expertly guiding the ship around the dangerous debris. The Celestial's hull remains intact, and you successfully navigate through the field.

    + {time > 7} [Take another action.]
        -> move_ship
    + [End Event Participation]
        -> end_result


= mythic_powers
~ time = time - 20
~ largeRocks = 0
~ criticalRisk = 0
~ hasDebris = false

Recognizing the severity of the situation, you tap into the legendary prowess of your mythic skill level, devising an unparalleled strategy to protect the Celestial. Investing 20 TIME units, you meticulously analyze the asteroid trajectory, pinpoint the safest path, adjust the Celestial's course, and direct the ship's laser defense system. At the same time, you collaborate with other pilots, synchronizing your efforts for a masterful execution. Through your extraordinary abilities and unwavering determination, the Celestial emerges unscathed from the treacherous debris field.

    + {time > 7} [Take another action.]
        -> move_ship
    + [End Event Participation]
        -> end_result





=== repair_damage ===
#choiceType: time-cost
~ temp skillValue = getSkillValue("management")
{ time == -1:
    ~ temp diceResult = rollDice("management")
}
    With your Management skill of {skillValue}, you rolled {skillValue} 6 sided dice. ({diceResult}) That gives you {time} TIME to spend on actions.
   Determined to minimize the damage caused by the debris, you spring into action, focusing on swift and effective repairs. Allocating your TIME strategically, you tackle the most pressing issues first:

   + [Patch up a hull breach with an emergency repair kit. #cost: 1]
     -> hull_patch

   * [Reboot the malfunctioning laser defense system. #cost: 2]
    -> reboot_laser
     

   * [Reinforce damaged structural supports. #cost: 1]
     -> reinforce_supports

   * [Repair damaged navigation sensors. #cost: 2]
        -> repair_navigation
    
    * [Monitor and adjust the shield generator to better protect the ship. #cost: 1]
        -> adjust_generator

    * [Deploy drones to clear a path through the debris field. #cost: 2]
        -> deploy_drones

    * [Coordinate with the engineering team to fortify vulnerable systems. #cost: 3]
        -> coordinate_team



= hull_patch
~ time = time - 1

You quickly grab an emergency repair kit and set to work, expertly sealing the hull breach in record time. The patch holds firm, preventing further damage and maintaining the ship's integrity.

    + {time > 0} [Take another action.]
        -> repair_damage
    + [End Event Participation]
        -> end_result



= reboot_laser
~ time = time - 1

Identifying a glitch in the laser defense system, you reboot the software and restore its functionality. The lasers come back online, ready to intercept any remaining debris.

    + {time > 0} [Take another action.]
        -> repair_damage
    + [End Event Participation]
        -> end_result



= reinforce_supports
~ time = time - 1

Grabbing a portable welding tool, you skillfully reinforce the damaged structural supports. Your efforts shore up the Celestial's framework, ensuring its stability in the face of ongoing threats.

    + {time > 0} [Take another action.]
        -> repair_damage
    + [End Event Participation]
        -> end_result



= repair_navigation
~ time = time - 2

 Locating the damaged navigation sensors, you work quickly to replace faulty components and recalibrate the system. With the sensors back online, the ship's navigation system is now fully operational.

    + {time > 0} [Take another action.]
        -> repair_damage
    + [End Event Participation]
        -> end_result
        



= adjust_generator
~ time = time - 1

You access the shield generator controls, fine-tuning the energy distribution to provide maximum protection against the incoming debris. The Celestial's shields now offer improved coverage, reducing the likelihood of further damage.

    + {time > 0} [Take another action.]
        -> repair_damage
    + [End Event Participation]
        -> end_result
        
        
        
= deploy_drones
~ time = time - 2

You activate the ship's fleet of drones and send them out to intercept and disperse the debris. The drones work tirelessly, clearing a path for the Celestial and reducing the threat of additional impacts.

    + {time > 0} [Take another action.]
        -> repair_damage
    + [End Event Participation]
        -> end_result
        

= coordinate_team
~ time = time - 3

You establish communication with the engineering team and work together to identify and reinforce the ship's most vulnerable systems. Through your combined efforts, the Celestial's critical components are safeguarded against potential damage from the debris.

    + {time > 0} [Take another action.]
        -> repair_damage
    + [End Event Participation]
        -> end_result
        
        


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
    ~ nextPage("dialog", "dialog-day-two")
-> END