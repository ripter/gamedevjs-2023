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
#background: ship/medical_zone.png

You enter the Health and Wellness District, a serene and inviting area of the ship dedicated to both physical and mental well-being. Here, you find a diverse array of facilities and practitioners, from medical professionals to therapists and fitness instructors. The soothing atmosphere, combined with the hum of conversation and the occasional sound of exercise equipment, creates a space where health and self-care are the primary focus.

    * [Visit the medical center for a routine check-up.]
        You decide to visit the medical center for a routine check-up. As you enter, you're greeted by a friendly nurse named Lila. "Hello there, I'm Lila! It's great to see people taking an interest in their health. We're here to help with anything from minor ailments to more complex health concerns. If you have any questions or need assistance, just let me know!"

    * [Check out the mental health and therapy center.]
        Curious about the ship's mental health services, you make your way to the therapy center. As you walk in, you're greeted by a warm, compassionate therapist named Dr. Chen. "Hi, I'm Dr. Chen. It's so important to take care of our mental well-being on this journey. We offer various therapy options, stress management workshops, and support groups. If you ever need someone to talk to, don't hesitate to reach out."

    * [Explore the fitness center and join a workout class.]
        Eager to get some exercise, you head over to the fitness center. The center is bustling with activity, and a friendly fitness instructor named Jordan approaches you. "Hey there, I'm Jordan! Welcome to our fitness center. We offer a wide range of classes and equipment for all skill levels. Whether you're a beginner or a seasoned athlete, we've got something for you. Feel free to ask me any questions or for recommendations."

    * [Relax in the meditation and yoga studio.]
        Seeking a moment of calm, you step into the meditation and yoga studio. The tranquil environment is a welcome respite from the bustling ship, and a gentle voice greets you. "Namaste, I'm Aria. We offer a variety of yoga and meditation classes to help you find balance and inner peace. If you're new to the practice or just want to learn more, I'm here to guide you."

-
The Health and Wellness District is a sanctuary for both body and mind, providing a supportive environment for the inhabitants of the Celestial to maintain and improve their well-being.


-> END