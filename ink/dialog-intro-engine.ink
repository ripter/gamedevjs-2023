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
#background: ship/engine_zone.png

As you enter the engine room, the low hum of the ship's massive propulsion system fills the air. This area is the heart of the Celestial's movement and navigation, and it's filled with engineers and technicians working diligently to maintain and monitor the ship's performance. The maze of machinery, control panels, and conduits create an intricate, organized chaos.

    * [Ask a technician about the engine's maintenance schedule.]
        Approaching one of the technicians, you ask about the engine's maintenance routine. The technician, named Alex, looks up from their work and smiles. "Hi, I'm Alex! We maintain a strict schedule here to ensure the engine runs smoothly. Every component has its own routine, and we follow a detailed checklist. If you're interested in learning more, I'd be happy to show you around."

    * [Inquire about the engine's fuel consumption and efficiency.]
        Curious about the ship's energy efficiency, you strike up a conversation with an engineer who is monitoring fuel levels. The engineer, named Priya, is happy to discuss the topic. "Hello, I'm Priya! The Celestial's engines are designed to be highly efficient, utilizing advanced technology to minimize fuel consumption. We're constantly working on improvements to make our ship even more sustainable. If you have any questions, just let me know!"

    * [Observe a group of engineers troubleshooting a minor issue.]
        Noticing a group of engineers huddled around a control panel, you decide to observe their troubleshooting process. As they successfully resolve the issue, one of the engineers, named Marcus, turns to you and introduces himself. "Hey there, I'm Marcus. Good timing - you just witnessed us fixing a small glitch in the system. It's all part of the job! If you want to learn more about what we do, feel free to ask."

    * [Ask about the future upgrades planned for the engine.]
        Interested in the engine's future development, you approach a senior engineer who is reviewing blueprints for potential upgrades. The engineer, named Sophia, greets you warmly. "Hello, I'm Sophia! We're always researching and planning enhancements for the Celestial's engines to ensure we're at the forefront of technology. If you're curious about our plans, I'd be more than happy to discuss them with you."

-
The engine room is a fascinating blend of technology and teamwork, where skilled professionals work tirelessly to keep the Celestial moving forward on its generational journey.


-> END