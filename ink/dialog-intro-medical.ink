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
#background: ship/medical_zone.png

You enter the Health and Wellness District, a serene and inviting area of the ship dedicated to both physical and mental well-being. Here, you find a diverse array of facilities and practitioners, from medical professionals to therapists and fitness instructors. The soothing atmosphere, combined with the hum of conversation and the occasional sound of exercise equipment, creates a space where health and self-care are the primary focus.

    * [Visit the medical center for a routine check-up.]
        -> checkup
 

    * [Check out the mental health and therapy center.]
        -> explore_center

    * [Explore the fitness center and join a workout class.]
        -> workout
 

    * [Relax in the meditation and yoga studio.]
        -> meditate


=== checkup ===
#npc: lila

As you meander through the Health and Wellness District, you spot the medical center and decide it's high time for a routine check-up. After all, who wouldn't want to ensure they're in tip-top shape for their adventures aboard the Celestial?

As you step through the sliding doors, a friendly nurse named Lila greets you with an infectious grin. "Hello there, I'm Lila!" she exclaims, her enthusiasm catching you slightly off guard. "It's great to see people taking an interest in their health. We're here to help with anything from minor ailments to more complex health concerns. If you have any questions or need assistance, just let me know!"


    * [Ask Lila about the most common health issues people face aboard the Celestial.]
        Lila nods, understanding your curiosity. "Well, aboard the Celestial, the most common health issues tend to be stress-related, like headaches and insomnia. We also see a fair amount of minor injuries from various recreational activities. But don't worry, we have excellent treatments and prevention programs to help people stay healthy!"
    
    * [Inquire about any new, cutting-edge medical treatments available on the ship.]
        Her eyes light up with excitement. "Oh, we're always researching and implementing the latest medical advancements! Just recently, we've started using nanobots for targeted drug delivery and advanced tissue repair. And our 3D bioprinting technology has made significant progress in creating replacement organs. It's truly an exciting time for medicine on the Celestial!"
    
    * [Admit that you're mostly here for the complimentary lollipops and ask if they have any new flavors.]
       Lila bursts into laughter, her grin widening. "You caught me! We do have some new flavors in stock – Galactic Grape, Starburst Strawberry, and my personal favorite, Nebula Nectarine! Make sure you grab one after your check-up. It's our little way of saying 'thanks for taking care of yourself'."
    
    * [Thank Lila for her help and proceed with your check-up.]
        "Of course! I'm always here to help," Lila says, her warm smile never faltering. "Now, let's get you checked out and make sure you're in prime condition for all your adventures aboard the Celestial. And don't forget that lollipop on your way out!"

-    
    ~ triggerEvent("meet-lila")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END



=== explore_center ===
#npc: lila

As you explore the Health and Wellness District, you can't help but feel curious about the ship's mental health services. With a sense of intrigue, you follow the signs to the therapy center, a welcoming space with calming colors and soothing music.

As you walk in, you're greeted by a warm, compassionate nurse named Lila. "Hi, I'm Lila. It's so important to take care of our mental well-being on this journey. We offer various therapy options, stress management workshops, and support groups. If you ever need someone to talk to, don't hesitate to reach out."

Lila chuckles softly and continues, "I'm also here to help with your physical health needs, so if you ever need a check-up or a lollipop, just come find me!"

"Now, would you like to learn more about our therapy options, join a stress management workshop, or maybe attend a support group?" Lila asks, her smile never fading.

    
    * [Learn more about the therapy options available on the ship.]
        Lila grins as she begins to explain the therapy options. "We have everything from traditional one-on-one sessions to group therapy, but our pièce de résistance is our virtual reality therapy!" she exclaims, her eyes twinkling with excitement.

        "You wouldn't believe the scenarios we can create in there," Lila continues. "Imagine facing your fear of heights on a tightrope suspended over a canyon, or practicing public speaking in front of a virtual crowd that throws rotten tomatoes if you mess up. All without any real-world consequences! It's both fun and therapeutic."

        Lila chuckles, "We've even had a few people come in just for the entertainment value, but they ended up learning something about themselves in the process. It's truly amazing what modern technology can do for mental health."

        Lila leans in conspiratorially, "But between you and me, my personal favorite is the virtual relaxation room. Picture yourself in a zen garden, the sound of a trickling waterfall in the background, without having to worry about bugs or sunburn. Absolute bliss!"

    
    * [Join a stress management workshop to learn relaxation techniques.]
        -> workout
    
    * [Thank Lila, and continue exploring the Health and Wellness District.]
        Expressing your gratitude to Lila, you smile and thank her for her help and the valuable information she provided. With a newfound appreciation for the various health services available on the Celestial, you continue exploring the Health and Wellness District, eager to discover even more ways to maintain your well-being during your journey through the stars.

-    
    ~ triggerEvent("meet-lila")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END


=== workout ===
#npc: Ravi

Choosing to join a stress management workshop, you find yourself in a room with a small group of people, all eager to learn relaxation techniques. The instructor, a cheerful man named Ravi, sports a thick beard and a constant grin. His soothing voice immediately puts everyone at ease.

"Now, imagine a serene beach, waves gently lapping at the shore," Ravi says, only to be interrupted by the loud snoring of a participant who has taken the relaxation exercise a bit too seriously.

The rest of the group chuckles, and Ravi smiles, saying, "Well, I suppose that's one way to achieve relaxation! Just remember, don't get too relaxed during the workshop, or you might miss out on the valuable techniques we're teaching."


-    
    ~ triggerEvent("meet-ravi")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END



=== meditate ===
#npc: Ravi

As you meander through the Health and Wellness District, a serene, softly lit space draws your attention. Emanating an atmosphere of tranquility, the meditation and yoga studio offers a welcome respite from the bustling ship. The gentle, soothing sound of a waterfall provides the perfect backdrop, while the scent of essential oils further relaxes your senses.

A friendly, easy-going instructor approaches you with a warm smile, his posture tall and relaxed. "Namaste, I'm Ravi," he says, extending his hand. "We offer a variety of yoga and meditation classes to help you find balance and inner peace amidst the excitement of life on the Celestial. Whether you're new to the practice or a seasoned yogi, I'm here to guide you along your journey. Feel free to ask any questions, and I'll be happy to help you find the right class or meditation technique for your needs."

    * [Ask Ravi about the different yoga styles offered at the studio.]
        Ravi's eyes light up as he describes the various yoga styles available at the studio, from the gentle flow of Hatha to the more intense and dynamic Vinyasa. "We also offer Yin, Restorative, and even Aerial yoga," he adds. "Our goal is to cater to every individual's needs and preferences. Don't hesitate to try a few different classes to find the style that suits you best."
    
    * [Inquire about meditation techniques and how to get started.]
        "Meditation is a wonderful way to cultivate mindfulness and inner peace," Ravi explains. "We teach various techniques, including breath awareness, loving-kindness, and body scans. For beginners, I recommend starting with a guided meditation to help you build a strong foundation. Remember, consistency is key, so even just a few minutes each day can make a world of difference."
    
    * [Join one of Ravi's beginner yoga classes to experience it firsthand.]
        Ravi leads you to the beginner's class, where you're greeted by a small group of friendly faces. The class begins with some gentle stretching, followed by foundational poses that help build strength and flexibility. Ravi's calm and reassuring guidance makes you feel at ease, and by the end of the class, you find yourself feeling more relaxed and centered than you have in a long time.
    
    * [Thank Ravi and continue exploring the Health and Wellness District.]
        "You're welcome," Ravi says with a genuine smile. "Remember, the door is always open, and we're here to support your journey towards balance and well-being." With a newfound sense of relaxation and curiosity, you continue your exploration of the Health and Wellness District, eager to discover more opportunities for self-care and personal growth.

-    
    ~ triggerEvent("meet-ravi")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
