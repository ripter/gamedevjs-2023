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
#background: ship/industrial_zone.png

You enter the Industrial Zone, a bustling area filled with the sounds of machinery and the hum of productivity. This district is crucial to the ship's functioning, as it houses manufacturing facilities, workshops, and repair stations. Here, skilled workers and engineers keep the Celestial running smoothly and efficiently.

    * [Visit the manufacturing facility and observe the production process.]
        -> observe_production

    * [Explore the workshops and meet the skilled workers.]
        -> meet_workers

    * [Check out the repair stations and learn about maintenance.]
        -> maintenance


=== observe_production ===
#npc: greg

In a realm where magic intertwines with the essence of technology, you venture towards the grand manufacturing facility, where the symphony of creation unfolds before your very eyes. Here, the skilled artisans and mighty machines weave their spellwork, giving birth to marvels that defy the mundane world.

As you stand in awe, beholding the intricate ballet of workers and their mechanical counterparts, a wise engineer by the name of Greg emerges from the cacophony. "Greetings, traveler! I am Greg, a humble guardian of these mystical arts," he proclaims, a proud glint in his eye. "Behold the wonder of our creations, where ingenuity and enchantment converge. If you wish to unravel the secrets of this place or partake in a tour guided by my hand, simply speak your desires, and I shall oblige!"

    * [Inquire about the magical elements that power the machinery.]
        Greg's eyes light up at your question. "Ah, you've noticed the subtle touch of magic in our machinery! We harness the energy of enchanted crystals to boost the efficiency and precision of our production processes. It's a delicate balance, blending the raw power of industry with the mystical forces that lie beneath the surface."

    * [Ask Greg to guide you on a tour through the manufacturing facility.]
        With a welcoming smile, Greg leads you on a tour of the facility, explaining the function of each area as you go. The marvels of engineering and magical innovation unfold before your eyes, and you're struck by the harmonious blend of tradition and progress. Greg's passion for his work is evident as he shares his knowledge and experience with you.

    * [Question how the workers and machines collaborate so harmoniously.]
        Greg nods in agreement, clearly proud of the seamless collaboration. "It's a dance, really. The workers and machines have to be in perfect sync to achieve this level of efficiency. We train our workers extensively and maintain a strong focus on communication. The machines, enhanced by magical elements, are designed to be intuitive and adaptable, allowing them to work in harmony with their human counterparts."
 
-    
    ~ triggerEvent("meet-greg")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
        

=== meet_workers ===
#npc: lena


Drawn to the myriad of workshops, you meander through the bustling facility, the air thick with the scent of industry and magic. Upon reaching a secluded nook, you find a skilled artisan named Lena, her deft hands weaving intricate components for the Celestial's many systems. Her workshop is adorned with gleaming trinkets and intricate contraptions, each a testament to her artistry.

"Ah, greetings, traveler!" Lena exclaims, pausing her work to greet you with a warm smile. "I am Lena, master craftswoman of the Celestial. Within these walls, I forge the custom components that breathe life into our wondrous vessel. My work is a delicate dance of alchemy and engineering, both challenging and rewarding in equal measure. Should you desire to know more, I am but a humble servant of knowledge, eager to share the secrets of my craft."

    * [Ask Lena about the materials she uses in her craft.]
        Lena's eyes light up with enthusiasm as she delves into the topic of her materials. "Ah, the very foundation of my work! I primarily use a rare alloy known as Celestium, which boasts remarkable strength and magical properties. It allows us to forge components that are both lightweight and durable, essential for maintaining the ship's agility and power. We also use other materials, each with their own unique properties, to craft a symphony of harmony and functionality."

    * [Inquire about Lena's most challenging project so far.]
        Lena ponders for a moment before answering, her face glowing with a proud smile. "The most challenging project I've undertaken was creating the intricate mechanisms for the Celestial's navigation system. The level of precision required was immense, but ultimately, it has proven to be one of my greatest accomplishments. The fruits of my labor now guide our vessel through the vastness of the cosmos, and I couldn't be prouder."

    * [Express curiosity about the role of magic in Lena's work.]
        "Ah, magic," Lena muses, her eyes twinkling with a hint of mystery. "Magic is the very essence that binds the mundane and the ethereal. In my work, I weave enchantments into each component I forge, imbuing them with a touch of the arcane. These enchantments enhance the performance of the ship's systems, granting us the ability to traverse the stars with grace and speed. But fear not, for though magic is a powerful force, it is wielded with great care and responsibility in my workshop."

-    
    ~ triggerEvent("meet-lena")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END



=== maintenance ===
#npc: elara

In the hallowed halls of ship maintenance, you find yourself drawn to the symphony of clanging and hissing at one of the many repair stations. Here, skilled technicians weave their expertise with mechanical precision, each movement a carefully choreographed dance to keep the Celestial in her prime. Amidst the bustling activity, a skilled and enigmatic mechanic named Elara emerges to greet you with a warm smile.

"Greetings, traveler! I am Elara, a dedicated keeper of the Celestial's inner workings. We tirelessly labor to maintain her systems in harmony, ensuring our steadfast vessel continues to guide us through the infinite expanse. If you seek knowledge or wish to delve deeper into the mysteries of our craft, do not hesitate to inquire, and I shall gladly share the wisdom of the stars."

    * [Inquire about the most critical systems aboard the Celestial.]
        Your curiosity piqued, you beseech Elara for insight into the Celestial's most vital systems. With a knowing nod, she regales you with tales of the ethereal engine that harnesses the very essence of the cosmos, the intricate life support network that sustains those who dwell within, and the celestial compass that guides our vessel through the vast unknown. Each system, she emphasizes, demands utmost care and devotion.
        
    * [Ask Elara about the challenges faced in maintaining the ship's complex machinery.]
        Eager to discern the trials faced by the skilled mechanics, you ask Elara about the challenges of tending to the Celestial's complex machinery. Her eyes glisten with the fire of passion as she recounts epic tales of conquering mechanical beasts, taming rogue components, and restoring harmony to the ship's inner workings. The path of a mechanic, she proclaims, is one of ceaseless vigilance and unyielding resolve.
        
    * [Seek guidance on how to learn the art of ship maintenance.]
        Enthralled by the noble craft of ship maintenance, you seek Elara's guidance on the path to mastering such an art. With a glimmer of approval, she imparts to you the wisdom of apprenticing under a seasoned mentor, studying ancient tomes of engineering knowledge, and practicing the sacred rites of mechanical intuition. Only then, she assures, may you embark upon the journey to becoming a guardian of the Celestial's inner sanctum.
        
-    
    ~ triggerEvent("meet-elara")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END

