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
#background: ship/research_zone.png


You enter the Research Complex, a district filled with state-of-the-art laboratories and cutting-edge technology. This area is where the Celestial's brightest minds work tirelessly to advance the ship's technology, conduct experiments, and uncover the secrets of the universe.

    * [Visit the physics laboratory and meet the researchers working on advanced propulsion.]
        You make your way to the physics laboratory, where a team of researchers is working on cutting-edge propulsion systems. One of the lead scientists, Dr. Emily, greets you warmly. "Hello, I'm Dr. Emily. We're working on improving the Celestial's propulsion and discovering new ways to travel faster and more efficiently. If you're interested in learning more, feel free to ask any questions!"

    * [Stop by the genetics lab to learn about their work on human longevity and health.]
        Curious about genetics research, you visit the genetics lab. There, you meet Dr. Michael, who is leading a team working on human longevity and health. "Hi, I'm Dr. Michael. We're studying the human genome and developing techniques to improve our health and extend our lifespans. If you have any questions about our work, please don't hesitate to ask!"

    * [Explore the robotics and artificial intelligence lab and meet the engineers who design and maintain the ship's automated systems.]
        Intrigued by robotics and AI, you visit the relevant lab. Amidst the buzzing machines and intricate algorithms, you meet the head engineer, Dr. Priya. "Hi there, I'm Dr. Priya. My team and I design and maintain the Celestial's automated systems, as well as develop advanced robotics and AI technology. If you'd like to know more about our work or the robots we create, feel free to ask!"

-
The Research Complex is an exciting and dynamic place where innovation and creativity drive the Celestial's progress, shaping its future in the vast reaches of space.


-> END