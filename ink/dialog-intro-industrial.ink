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
#background: ship/industrial_zone.png

You enter the Industrial Zone, a bustling area filled with the sounds of machinery and the hum of productivity. This district is crucial to the ship's functioning, as it houses manufacturing facilities, workshops, and repair stations. Here, skilled workers and engineers keep the Celestial running smoothly and efficiently.

    * [Visit the manufacturing facility and observe the production process.]
        You head to the manufacturing facility, eager to see the production process up close. As you watch the intricate dance of machines and workers, a friendly engineer named Greg approaches you. "Hey there, I'm Greg! I'm one of the engineers responsible for keeping this place running. It's impressive, isn't it? If you're curious about how anything works or want a quick tour, just let me know!"

    * [Explore the workshops and meet the skilled workers.]
        Intrigued by the variety of workshops, you decide to explore and meet some of the skilled workers. In a cozy corner, you encounter a talented artisan named Lena, who's busy crafting intricate parts for the ship. "Hello! I'm Lena. Welcome to my workshop! I specialize in creating custom-made components for the Celestial. It's a challenging and rewarding job. If you're interested in learning more, feel free to ask!"

    * [Check out the repair stations and learn about maintenance.]
        Curious about ship maintenance, you visit one of the many repair stations. As you take in the sights of technicians working on various systems, a knowledgeable mechanic named Ravi greets you. "Hi, I'm Ravi. I work on keeping the ship's systems in top shape. Maintenance is essential to ensure the Celestial stays on course and functions optimally. If you have any questions about what we do here, don't hesitate to ask!"

-
The Industrial Zone is a testament to the hard work and dedication of the Celestial's workforce, a vital cog in the machine that keeps the ship running and its inhabitants safe.

-> END