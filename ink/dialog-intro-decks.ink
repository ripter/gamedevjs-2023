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
#background: ship/decks_zone.png

You step into the Outer Decks, an area that provides breathtaking views of the cosmos and access to the exterior of the ship. This district is responsible for monitoring and maintaining the ship's external systems, as well as conducting astronomical research and managing smaller crafts.

    * [Visit the observation deck and take in the stunning view of space.]
        -> ovservation_deck

    * [Explore the spacecraft hangar and learn about the smaller crafts.]
        -> hangar

    * [Check out the exterior maintenance area and meet the engineers working there.]
        -> outside

- 
The Outer Decks offer a unique perspective of the universe and the challenges faced by the Celestial as it journeys through the vastness of space, driven by the dedication and expertise of its crew.

-> END


=== ovservation_deck ===
#npc: julia

As you traverse the metallic corridors of the Celestial, you find yourself on the observation deck, where a breathtaking panorama of the cosmos unfolds before your eyes. The vast expanse of space stretches out, a seemingly infinite array of stars and celestial bodies twinkling in the void. Your thoughts are consumed by the magnificence of the universe when a friendly astronomer named Julia joins your side.

"Hi there, I'm Julia," she says, a sparkle of enthusiasm in her eyes. "I'm an astronomer specializing in astrophysics and celestial navigation. My role aboard the Celestial is to study the cosmic phenomena around us, analyze our position in the vastness of space, and help navigate our vessel through the intricate dance of celestial bodies. If you're curious about the stars, our trajectory, or the wonders of the universe, I'd be more than happy to share my knowledge with you."

    * [Ask Julia about the ship's current position in the galaxy.]
        Responding to your curiosity about the ship's position, Julia brings up a detailed holographic map of the galaxy. "We're currently traversing the outer arm of the Milky Way," she explains, pointing to a specific region on the map. "Our journey takes us through a multitude of star systems, each with its unique properties and challenges. It's truly a thrilling time to be exploring the cosmos!"
        
    * [Inquire about the most interesting celestial phenomenon she has studied.]
        Julia's eyes light up as she recalls her favorite celestial phenomenon. "One of the most fascinating things I've had the pleasure of studying is the dance of binary stars," she shares. "These are star systems where two stars are locked in a gravitational embrace, orbiting each other in a cosmic ballet. The interactions between these stars can lead to extraordinary events like stellar collisions or the formation of new celestial objects. It's a testament to the ever-changing nature of the universe."
        
    * [Learn more about the process of navigating the ship through space.]
        Julia is eager to explain the complex task of navigating the Celestial through space. "Navigating our ship involves a combination of astrometry, celestial mechanics, and advanced computer algorithms," she says. "We continually analyze data from a myriad of sources, including star maps, gravitational sensors, and electromagnetic readings. This information helps us plot an optimal course that ensures the Celestial's safe and efficient passage through the vastness of space."

-    
    ~ triggerEvent("meet-julia")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END


=== hangar ===
#npc: samantha

As you meander through the expansive spacecraft hangar, you find yourself surrounded by an impressive collection of smaller crafts, each designed for a specific purpose. You can't help but feel awed by the marvels of engineering on display. A knowledgeable pilot named Samantha notices your interest and approaches you with a friendly smile. "Hello there, I'm Samantha. I'm one of the pilots responsible for operating these smaller crafts during our missions. From shuttles and science vessels to utility drones, each one has been meticulously engineered to serve a vital function. If you'd like to learn more about their design or purpose, please feel free to ask!"

    * [Ask about the science vessels and their research capabilities.]
        As you inquire about the science vessels, Samantha's eyes light up. "Ah, the science vessels are equipped with state-of-the-art sensors and instruments to conduct various experiments and gather data," she explains. "They're designed to explore celestial phenomena, analyze cosmic structures, and monitor the space environment, helping us to better understand the universe we're traversing. Their versatility makes them indispensable tools for scientific discovery."

    * [Learn more about the shuttles and their roles in transportation and logistics.]
        Samantha nods, understanding your curiosity about the shuttles. "Shuttles primarily serve as transportation and logistics vehicles. They're designed to ferry passengers, cargo, and supplies between the Celestial and other stations or planetary surfaces. With configurable interiors and efficient propulsion systems, they ensure that we can reliably transport people and resources when needed."

    * [Inquire about the utility drones and their various functions.]
        "Utility drones are fascinating little machines," Samantha says with enthusiasm. "They're equipped with an array of tools and sensors, allowing them to perform a wide variety of tasks, from inspections and repairs to resource extraction and data collection. They're remotely operated by technicians aboard the Celestial, making them invaluable for situations where human presence might be too risky or impractical."

    * [Ask about the pilot training program and how to become a pilot.]
        Samantha beams at your interest in becoming a pilot. "Becoming a pilot on the Celestial requires rigorous training and dedication. You'll need to master various spacecraft systems, navigation techniques, and flight procedures. Additionally, pilots must be skilled in handling emergency situations and making quick decisions under pressure. If you're interested in pursuing this career path, I recommend talking to our chief pilot, who can provide more information on the training program and requirements."


-    
    ~ triggerEvent("meet-samantha")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
        
        

=== outside ===
#npc: elisa

In a flurry of activity, you find yourself in the exterior maintenance area, where engineers in comically oversized spacesuits scurry about, tending to the ship's hull like diligent worker bees. Through an intercom, you hear the voice of a cheerful engineer named Elisa. "Greetings, curious traveler! I'm Elisa, ringleader of this cosmic circus. My team and I are tasked with maintaining the Celestial's outer systems, ensuring our spaceship remains the sleekest vessel this side of the galaxy. Got any burning questions about the space shenanigans we perform out here? Just holler!"

-    
    ~ triggerEvent("meet-elisa")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
        
       