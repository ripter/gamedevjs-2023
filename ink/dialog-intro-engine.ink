// How to use:
// Global Vars given to every dialog story.
VAR timePlayer = 0
VAR timeSinceLastRun = 0
VAR totalVisits = 0
// Tags:
// `background`, `npc` set images in the dialog page.
// Functions allow updating the game state and moving onto the next page.
EXTERNAL triggerEvent(code)
EXTERNAL completedEvent(code)
EXTERNAL nextPage(url, value)


-> start

=== start ===
#background: ship/engine_zone.png

As you enter the engine room, the low hum of the ship's massive propulsion system fills the air. This area is the heart of the Celestial's movement and navigation, and it's filled with engineers and technicians working diligently to maintain and monitor the ship's performance. The maze of machinery, control panels, and conduits create an intricate, organized chaos.

    * [Ask a technician about the engine's maintenance schedule.]
        ->  engine_room

    * [Inquire about the engine's fuel consumption and efficiency.]
        -> engine_efficiency

    * [Observe a group of engineers troubleshooting a minor issue.]
       -> observe_group

    * [Ask about the future upgrades planned for the engine.]
        -> upgrade_plans
       


=== engine_room ===
#npc: alex
~ temp didMeetAlex = completedEvent("meet-alex") > 0


Upon entering the dimly lit, cavernous engine room, you found yourself marveling at the intricate network of pipes, gears, and blinking lights that appeared to be the very beating heart of the Celestial. The air hummed with the vibrations of the colossal engine, as if a thousand tiny imps were diligently whirring away in unison to keep the vessel afloat.

In your quest to unravel the mysteries of this mechanical marvel, you approach {didMeetAlex:  a familiar face - a technician you had seen before in the Central Hub.} The technician, Alex, looked up from their work as you neared, a smile blooming across their grease-streaked face.

"Ahoy there, curious wanderer!" Alex exclaimed, wiping their hands on a well-worn cloth. "{didMeetAlex: Fancy meeting you here again!} I'm Alex, the humble caretaker of this magnificent beast we call an engine. We adhere to a strict maintenance routine here, ensuring that every cog and piston runs in perfect harmony. Each component has its own set of tasks, and we follow a detailed checklist that would make even the most pedantic librarian blush."

Sensing your interest, Alex continued, "If you'd like to delve deeper into the world of engine maintenance, I'd be more than happy to guide you on a behind-the-scenes tour."


    * [Accept Alex's offer and embark on a guided tour of the engine room, learning about the inner workings of the Celestial's mechanical heart.]
    * [Inquire about any ongoing issues or challenges faced by the engine room technicians, hoping to gain insight into the less glamorous aspects of their work.]
    * [Discuss the role of the engine in the Celestial's day-to-day operations and how its performance impacts the lives of the vessel's inhabitants.]
    * [Thank Alex for their time but decide to explore the engine room independently, observing the various technicians as they conduct their work.]


-
Your encounter with Alex and the engine room left you with a newfound appreciation for the sheer complexity and precision required to keep the Celestial running smoothly. As you exited the engine room, the steady hum of the mighty engine reverberated through the corridors, a comforting reminder of the dedicated team working tirelessly to maintain the vessel's lifeblood.

{didMeetAlex:
    ~ triggerEvent("meet-alex-again")
- else:
    ~ triggerEvent("meet-alex-first-engine")
}
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
        


=== engine_efficiency ===
#npc: priya

As you wandered through the engine room, your curiosity piqued by the ship's energy efficiency, you spotted a nearby engineer meticulously monitoring the fuel levels on a glowing screen. The engineer's gaze flitted between various charts and graphs, her fingers deftly dancing across the controls.

Venturing closer, you decided to strike up a conversation about the Celestial's fuel consumption and overall sustainability. The engineer, named Priya, looked up from her work and greeted you with a warm smile.

"Ah, hello there!" Priya exclaimed, her eyes sparkling with enthusiasm. "I'm Priya, and I'm delighted to meet someone else who's interested in the finer points of energy efficiency! The Celestial's engines are the pinnacle of cutting-edge technology, designed to minimize fuel consumption without sacrificing performance."

Her voice brimming with pride, she continued, "Of course, there's always room for improvement, and we're constantly tinkering away to make our ship even more sustainable. If you have any questions or want to delve into the nitty-gritty details, just let me know!"


    * [Ask Priya about the specific technologies used in the Celestial's engines that contribute to its energy efficiency.]
    
    * [Inquire about any ongoing projects or research aimed at further improving the ship's fuel consumption and sustainability.]

    * [Discuss the implications of energy efficiency for the Celestial's overall mission and the well-being of its inhabitants.]

    * [Thank Priya for the information and continue exploring the engine room, reflecting on the importance of sustainability in the ship's design.]
    

-
As your conversation with Priya unfolded, you found yourself engrossed in the complex world of energy efficiency and the tireless efforts of the engineers who worked to ensure that the Celestial remained a shining example of sustainable technology.

    ~ triggerEvent("meet-priya")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END


=== observe_group ===
#npc: marcus

As you meandered through the engine room, your attention was drawn to a group of engineers huddled around a control panel, their faces etched with concentration. Sensing a learning opportunity, you decided to observe their troubleshooting process from a respectful distance.

Murmured discussions were punctuated by the occasional beep or whirr of machinery as the engineers worked diligently to resolve the issue at hand. With a final flourish of activity, the control panel emitted a satisfying chime, and the group's collective tension seemed to dissipate.

Noticing your presence, one of the engineers - a tall, lanky fellow with a hint of a grin - turned to face you and extended a friendly hand. "Hey there, I'm Marcus!" he said cheerfully. "Good timing on your part - you just witnessed us fixing a small glitch in the system. It's all part of the job around here!"

He gestured expansively at the surrounding machinery before continuing, "If you want to learn more about what we do or maybe even pick up some troubleshooting tips, feel free to ask. We're always happy to share our knowledge!"

    * [Ask Marcus about the specific issue they just resolved and what steps they took to fix it.]
    
    * [Inquire about the most common types of glitches they encounter and how they prioritize repairs.]
    
    * [Discuss the importance of teamwork and collaboration among the engineers in the engine room.]
    
    * [Thank Marcus for the offer and continue exploring the engine room, fascinated by the intricate dance of troubleshooting and problem-solving that kept the Celestial running smoothly.]

-
As you chatted with Marcus, you couldn't help but admire the ingenuity and dedication of the engineers who ensured that the heart of the Celestial beat steadily, even in the face of unexpected challenges.

    ~ triggerEvent("meet-marcus")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END


=== upgrade_plans ===
#npc: sophia

Wandering deeper into the engine room, your gaze was drawn to a senior engineer meticulously examining a set of blueprints spread across a nearby table. The diagrams and schematics hinted at potential upgrades that could further enhance the engine's performance. Intrigued by the possibilities, you approached the engineer, hoping to learn more.

The engineer, a woman with a steely gaze and an aura of determination, looked up from her work and greeted you with a warm smile. "Hello, I'm Sophia!" she said, extending a hand in welcome. "We're always researching and planning enhancements for the Celestial's engines to ensure we're at the forefront of technology. If you're curious about our plans, I'd be more than happy to discuss them with you."


    * [Ask Sophia about the most significant upgrades they're currently considering for the Celestial's engines.]
    
    * [Inquire about the process of implementing engine upgrades and how they balance innovation with the need for reliability.]
    
    * [Discuss the role of environmental sustainability in the development of new engine technologies.]

    * [Thank Sophia for the offer and continue exploring the engine room, marveling at the ceaseless pursuit of progress that propelled the Celestial ever forward.]

-
As you conversed with Sophia, you gained a newfound appreciation for the dedication and ingenuity of the engineers who continually pushed the boundaries of technology, ensuring that the Celestial remained a beacon of innovation and excellence on its journey through the stars.

    ~ triggerEvent("meet-sophia")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END




