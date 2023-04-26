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
#background: ship/residential_zone.png

As you enter the Residential Districts, you're surrounded by the comfortable and familiar hum of daily life on the Celestial. This district is home to countless families and individuals who have made their lives within the confines of the ship, turning it into a vibrant and diverse community.
    
    * [Attend a neighborhood meeting and meet the local community leader.]
        You decide to attend a neighborhood meeting, where you're introduced to the local community leader, Helen. "Welcome! I'm Helen, the community leader for this area. Our neighborhood meetings are a great way to get involved, voice your concerns, and meet your fellow residents. If you have any questions about the community, please don't hesitate to ask!"

    * [Visit a nearby park and strike up a conversation with a friendly local.]
        You choose to visit a nearby park, where you come across a friendly local named Carlos. "Hey there, I'm Carlos. I've been living in this district for quite some time now. It's a great place to call home, with lots of friendly faces and a strong sense of community. If you have any questions about the area or need help finding your way around, just let me know!"

    * [Drop by a local café and chat with the barista.]
        You decide to drop by a local café, where the aroma of freshly brewed coffee and warm pastries welcomes you. The friendly barista, Sarah, greets you with a smile. "Hi, I'm Sarah. Welcome to our café! This is a favorite spot for locals to gather, catch up, and unwind. If you have any questions about the Residential Districts or just need a recommendation for a delicious beverage, feel free to ask!"

-
The Residential Districts offer a sense of belonging and warmth, providing a nurturing environment for the people living on the Celestial as they navigate their lives in the vast expanse of space.

    ~ triggerEvent("visit-residential-zone")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
        
        

