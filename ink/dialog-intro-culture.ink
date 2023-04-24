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
#background: ship/culture_zone.png

Scene: Cultural and Arts District

You step into the vibrant Cultural and Arts District, immediately surrounded by the sights, sounds, and smells of creativity. Beautiful murals and sculptures adorn the area, while the sounds of music and laughter fill the air. Various venues host performances, workshops, and exhibits that showcase the diverse talents of the Celestial's inhabitants.

    *  [Attend a painting workshop and meet the instructor.]
        Intrigued by a colorful painting workshop, you decide to join. The instructor, Isabella, welcomes you with a warm smile. "Hello, I'm Isabella! Welcome to my painting workshop! I hope you'll enjoy exploring your creativity with us today. Feel free to ask me anything, and I'll be happy to help."

    * [Watch a street dance performance and chat with one of the dancers.]
        Captivated by a group of street dancers, you can't help but stop and watch their energetic and mesmerizing performance. After the show, you strike up a conversation with one of the dancers, Kai. "Hey there, I'm Kai! Thanks for watching our performance! I love sharing our passion for dance with others. If you have any questions or want to learn some moves, just let me know!"

    * [Visit a poetry reading and talk with the poet.]
        Drawn to a cozy corner where a poetry reading is taking place, you find a seat and immerse yourself in the world of words. After the reading, you approach the poet, named Luna, to express your admiration. "Hello, I'm Luna. I'm so glad you enjoyed my poetry! It's always a pleasure to share my thoughts and feelings through verse. If you'd like to discuss poetry or writing further, I'd be happy to chat."

    * [Explore a photography exhibit and meet the photographer.]
        Intrigued by a photography exhibit, you wander through the gallery, admiring the stunning images that capture the essence of life on the Celestial. The photographer, Oliver, notices your interest and engages you in conversation. "Hi there, I'm Oliver! It's always great to see someone appreciating the beauty of photography. If you'd like to know more about my work or discuss photography in general, feel free to ask!"

-
As you continue to explore the Cultural and Arts District, you're inspired by the abundance of talent and creativity on display. This area serves as a testament to the power of art in connecting people and nurturing the human spirit.


-> END