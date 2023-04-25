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
#background: ship/culture_zone.png

Scene: Cultural and Arts District

You step into the vibrant Cultural and Arts District, immediately surrounded by the sights, sounds, and smells of creativity. Beautiful murals and sculptures adorn the area, while the sounds of music and laughter fill the air. Various venues host performances, workshops, and exhibits that showcase the diverse talents of the Celestial's inhabitants.

As you continue to explore the Cultural and Arts District, you're inspired by the abundance of talent and creativity on display. This area serves as a testament to the power of art in connecting people and nurturing the human spirit.

    *  [Attend a painting workshop and meet the instructor.]
        -> paint_workshop

    * [Watch a street dance performance and chat with one of the dancers.]
        -> watch_dance

    * [Visit a poetry reading and talk with the poet.]
        -> poetry_reading

    * [Explore a photography exhibit and meet the photographer.]
        -> explore_photography


=== paint_workshop ===
#npc: isabella
As you stroll through the Cultural and Arts District, your attention is drawn to a vibrant painting workshop bustling with enthusiastic participants. Their canvases come alive with bold colors and unique artistic expressions. Intrigued, you decide to join in the creative fun.

Upon entering, the instructor, Isabella, greets you with a warm, welcoming smile. "Hello! I'm Isabella, and this is our lively little painting workshop! I'm thrilled you've decided to join us today. We're all about exploring and celebrating creativity here, so please, make yourself at home. If you have any questions or need any guidance, just give me a shout, and I'll be more than happy to help."

With Isabella's encouragement, you grab a paintbrush and a palette, ready to embark on your own artistic journey. As you stand before your canvas, you're presented with a few choices:

    * Ask Isabella for advice on choosing the perfect color palette to start your painting.
    * Begin painting an abstract piece, allowing your intuition to guide your brushstrokes.
    * Attempt to recreate a beautiful landscape you've seen during your travels on the Celestial.
    * Paint a portrait of one of the other workshop participants, capturing their unique expression.
    
-    
As you make your decision and start applying colors to the canvas, you find yourself immersed in the creative process, drawing inspiration from the energy and camaraderie in the room. And, as your masterpiece takes shape, you can't help but feel a deep sense of satisfaction and joy in the newfound artistic expression you've discovered in the Cultural and Arts District.

    ~ triggerEvent("meet-isabella")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END


=== watch_dance ===
#npc: kai

As you amble along the bustling byways of the Cultural and Arts District, the air is filled with a rhythm that feels like it's trying to teach your feet how to dance. The syncopated beats beckon you closer, and you find yourself drawn to a lively group of street dancers, each one demonstrating an entirely different way to defy gravity with their limbs.

The performance is a colorful whirlwind of energy and flair, and you can't help but be mesmerized. When the final note of the music hangs in the air like a farewell, the dancers finish their dazzling display, and the crowd erupts into a storm of applause.

As the audience begins to dissipate, you seize the opportunity to strike up a conversation with one of the dancers, Kai, who is busy mopping their brow with a towel that's seen better days.

"Ahoy there!" Kai exclaims, a grin lighting up their face. "I'm Kai, purveyor of dance and occasional dabbler in the art of conversation! Your applause warms the cockles of my heart! If you have questions about the dance or want to learn some moves that'll make you the talk of the town, don't be shy!"

With the door to the world of dance flung wide open before you, a variety of options dance around in your head:

    * [Inquire about the myriad styles of dance that Kai and their troupe perform.]
    
    * [Request an impromptu lesson in footwork that'll leave your friends green with envy.]
    
    * [Quiz Kai on any upcoming events that might tickle your artistic fancy in the Cultural and Arts District.]
    
    * [Engage in a lively discussion about the arts, sharing tales of your own creative escapades on the Celestial.]

-
As you chat with Kai, you can't help but marvel at the boundless passion and dedication these street performers embody. You've stumbled upon a slice of life that breathes vibrant color into the tapestry of the Celestial, and the memory of this chance encounter will dance in your mind for days to come.


    ~ triggerEvent("meet-kai")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END



=== poetry_reading ==
#npc: luna

As you ambled through the Cultural and Arts District, the subtle sound of spoken words, floating like dandelion seeds on a warm breeze, caught your ear. Intrigued, you tracked the lilting voices to a cozy corner, where an intimate gathering of word aficionados huddled together like penguins sharing warmth.

The poet, Luna, spun her words into a delicate web of emotion, each syllable resonating with the audience like the plucked strings of a harp. You found yourself tangled up in her linguistic dance, and as the reading ended, the room erupted into applause that sounded like a thousand fairies clapping their tiny hands.

Feeling as if you'd just stepped off a particularly enjoyable rollercoaster of emotions, you approached Luna to gush about her performance. "Greetings," she said, her eyes sparkling like the finest glass marbles, "I'm Luna, and I'm delighted you enjoyed my little parade of syllables. Poetry, you see, is a way for me to capture thoughts and feelings and put them in a jar for others to examine. If you'd like to chat about verses and meter, or even the rhymes of ancient times, I'd be more than happy to oblige."

As you chatted with Luna, several possibilities flitted through your mind:

    * [Inquire about the inspiration behind her rhythmic incantations and the themes she dabbles in.]
    * [Summon your courage and regale Luna with a few lines of your own versified musings, seeking her sage advice.]
    * [Ask about any upcoming events in the Cultural and Arts District where more poets may gather and weave their wordy wonders.]
    * [Engage Luna in a lighthearted dispute over the role of poetry in the grand tapestry of life aboard the Celestial.]

-

Your tête-à-tête with Luna left an indelible mark on your heart, and as you wandered away from the cozy corner, her words continued to pirouette through your thoughts. In the days that followed, you found yourself jotting down scraps of ideas and emotions, forever changed by Luna's passion for the alchemy of language.

    ~ triggerEvent("meet-luna")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END


=== explore_photography ===
#npc: oliver

As you meandered through the Cultural and Arts District, your gaze was ensnared by an array of gleaming frames, each one holding a moment in time like a fly trapped in amber. Unable to resist the siren call of the images, you sauntered into the gallery, awash with a sense of intrigue.

Within the hallowed halls of the exhibition, the photographer, Oliver, had captured the essence of life aboard the Celestial in a way that made you feel as though you'd been transported to other parts of the great ship. Each image was a lovingly crafted slice of eternity, as if the artist had caught the world with its pants down, and given it a moment to remember forever.

As you moved from one captivating image to another, Oliver emerged from the shadows like a stealthy chameleon, his demeanor suggesting he was eager to discuss his masterpieces. "Greetings, fellow art enthusiast," he said, his voice smooth as the finest velvet, "I'm Oliver, the humble capturer of light and shadow. It warms the cockles of my heart to see someone appreciating the beauty of photography. Should you have any burning questions about my work or the mystical craft of image-capturing in general, please, don't hesitate to ask!"

With Oliver's words hanging in the air like a fine mist, you found yourself presented with several choices:

    * [Request a guided tour of the exhibition, learning about the stories and secrets behind each carefully composed snapshot.]
    
    * [Share your own experiences with photography, whether they be amateurish forays or more seasoned endeavors, and engage in a spirited discussion about the art form.]
    
    * [Ask Oliver about the techniques and equipment he used to create his striking images, hoping to glean some valuable insights from the master himself.]
    
    * [Delve into the topic of the Celestial's rich cultural tapestry, and how photography plays a role in chronicling the lives of its denizens.]

-
You leave with a newfound appreciation for the magic of photography. As you exited the gallery, the world outside seemed somehow more vivid, each moment a potential masterpiece just waiting to be captured by a discerning eye.

    ~ triggerEvent("meet-oliver")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END