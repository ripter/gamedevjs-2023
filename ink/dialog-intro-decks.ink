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
        You head to the observation deck and are greeted by an awe-inspiring panorama of the stars and distant celestial bodies. As you marvel at the beauty of the universe, a friendly astronomer named Julia approaches you. "Hi there, I'm Julia. I study the cosmos and help navigate the Celestial through space. If you have any questions about the stars or our journey, please feel free to ask!"

    * [Explore the spacecraft hangar and learn about the smaller crafts.]
        Intrigued by the smaller crafts, you venture into the spacecraft hangar. Amidst the neatly arranged vessels, you meet a skilled pilot named Marcus. "Hey, I'm Marcus! I fly these smaller crafts for various missions, like scouting and resource collection. If you're curious about any of the ships or how they're used, just let me know!"

    * [Check out the exterior maintenance area and meet the engineers working there.]
        You head to the exterior maintenance area, where engineers clad in spacesuits are busy performing various tasks on the ship's hull. Through an intercom, you're introduced to a diligent engineer named Elisa. "Hello! I'm Elisa. My team and I are responsible for maintaining the Celestial's outer systems and making sure everything is in working order. If you have any questions about what we do out here, don't hesitate to ask!"

- 
The Outer Decks offer a unique perspective of the universe and the challenges faced by the Celestial as it journeys through the vastness of space, driven by the dedication and expertise of its crew.

-> END