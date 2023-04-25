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
#background: ship/central_hub_zone.png

As you step into the bustling Central Hub, you marvel at the sheer scale of it all. People from all over the Celestial move about, going about their daily tasks. In the distance, you spot the familiar figure of your mother, who works as a coordinator in the Central Hub. You can't help but smile, thinking about how she always finds time for you despite her busy schedule.

    * [Walk over to your mother and greet her.]
        -> greet_mom

    * Explore the Central Hub and introduce yourself to a stranger.
        -> greet_alex
        -> END

    * Head to the Communication Center and meet the person in charge.
        -> greet_jordan


=== greet_mom ===
#npc: mother

You find your mother, Maria, in her office, focused intently on her work. As soon as she sees you, her face lights up, and she welcomes you with open arms.

Mother: "Oh, dear! What a pleasant surprise! I'm so happy to see you. How have you been? Are you finding your way around the ship and settling in?"

    * ["Yes, everything's going well. I'm enjoying exploring the different districts and meeting new people."]
        Maria smiles warmly. "That's wonderful to hear. I'm so proud of you for embracing this journey and making the most of the opportunities that come your way. Remember, you can always count on me for support and advice."

    * ["To be honest, I'm feeling a bit overwhelmed. There's so much to see and do."]
        Maria nods understandingly. "It can be overwhelming at times, but don't worry, you'll find your footing soon enough. Just remember that it's okay to take things one step at a time and that I'm always here for you if you need help or advice."

    * ["I'm not sure yet. I'm still trying to figure out what I want to do and where I want to go."]
        Maria offers an encouraging smile. "It's perfectly natural to feel uncertain at times. Exploring your options and discovering your passions is all part of the journey. Just know that I'm here to support you in any way I can."

-
After a heartfelt conversation with your mother, you leave her office feeling reassured and grateful for her love and support. Knowing she's there for you, no matter what challenges you face, fills you with a sense of comfort and determination.

    * [Learn about another area on the ship.]
        ~ triggerEvent("visit-central-hub-zone")
        ~ nextPage("ship", "dialog-intro")
-> END


=== greet_alex ===
#npc: alex

You decide to checkout the complex holographic display in the Central Hub, showcasing real-time data of the Celestial's various systems, as well as a 3D map of the surrounding space.

As you approach the holographic display, you spot Alax waving at you enthusiastically, their eyes sparkling with excitement.

Alax: "Hey there! I'm glad you made it. This display is one of my favorite spots on the ship. It's incredible how it combines art and technology to provide vital information in such a visually appealing way."

    * ["It's amazing! I've never seen anything like this before."]
        Alax grins. "Right? The engineers and artists who designed it did a fantastic job. There's always something new to discover, and I never get tired of watching it."

    * ["I can see why you like it, but I'm not sure I understand what everything represents."]
        Alax nods. "No worries! I'd be happy to give you a quick rundown of the display's features and how to interpret the data. It can be a bit overwhelming at first, but you'll get the hang of it in no time."

    * ["It's interesting, but I'm more curious about your work as an engineer. What do you do?"]
        Alax smiles, clearly passionate about their work. "I appreciate your interest! I work on maintaining and upgrading the ship's various systems, from life support to propulsion. It's a challenging job, but I love solving problems and knowing that my work helps keep the Celestial running smoothly."

-
As you continue to chat with Alax, you can't help but feel inspired by their passion for engineering and their appreciation for the beauty of the holographic display. You leave the Central Hub with a newfound appreciation for the blend of art and technology that exists on the ship, as well as a deeper connection with your new friend, Alax.

    * [Learn about another area on the ship.]
        ~ triggerEvent("meet-alex")
        ~ nextPage("ship", "dialog-intro")
-> END


=== greet_jordan ===
#npc: jordan

You decide to visit the Communication Center, intrigued by the idea of seeing how the Celestial maintains contact with the outside universe. As you enter the bustling room filled with advanced equipment, you notice a uniformed officer examining a console. The officer's name tag reads "Jordan."

Jordan looks up from the console and notices your curiosity. They smile warmly and approach you.

Jordan: "Hello there! It's not often we get visitors in the Communication Center. My name is Jordan. Can I help you with anything?"

    * ["I was just curious about how the Celestial communicates with other ships and stations. Can you tell me more about it?"]
        Jordan nods, enthusiasm lighting up their face. "Of course! We use a combination of cutting-edge technologies, including quantum entanglement and subspace transmissions, to maintain real-time communication with other ships and stations. It's crucial for coordinating trade, research, and security efforts."

    * ["I'm interested in learning more about your role as an officer. What do you do here?"]
        Jordan stands a little taller, clearly proud of their position. "As an officer in the Celestial's communication division, my main responsibilities include monitoring incoming and outgoing transmissions, ensuring smooth communication with other vessels, and maintaining the integrity of our communication systems."

    * ["This place seems so busy and complex. How do you keep up with everything?"]
        Jordan chuckles. "It can be a bit overwhelming at times, but we have a great team here. We all work together to make sure everything runs smoothly. Plus, our state-of-the-art systems make it easier to manage the flow of information."

-
Your conversation with Jordan leaves you with a greater understanding of the importance of communication in the vastness of space. As you depart the Communication Center, you appreciate the hard work and dedication of the officers like Jordan who keep the Celestial connected to the rest of the universe.

     * [Learn about another area on the ship.]
        ~ triggerEvent("meet-jordan")
        ~ nextPage("ship", "dialog-intro")
-> END

