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

As you approach your mother, she notices you and her face lights up with a warm smile. "Oh, there you are! It's always a pleasure to see you here. How's your day going? Is there anything I can help you with?"

-> END


=== greet_alex ===
#npc: alex
You decide to venture further into the Central Hub and meet new people. As you wander, you come across an interesting individual named Alex, who is busy working on a complex holographic display. "Hi, I'm Alex. I work on monitoring and analyzing the ship's systems. Nice to meet you!"

-> END


=== greet_jordan ===
#npc: jordan
Curious about the Communication Center, you head in that direction. As you enter, you're greeted by a stern face named Jordan. "Hello! I'm Jordan, the Communication Center's supervisor. It's nice to meet you! Is there anything specific you'd like to know about our work here?"

-> END

