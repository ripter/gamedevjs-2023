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
#background: ship/commercial_zone.png


As you enter the lively Commercial District, you're instantly captivated by the energy and atmosphere. A mix of shops, restaurants, and entertainment venues line the streets, catering to every taste and interest. The hum of conversation and laughter fills the air, while the aroma of various cuisines wafts through the bustling walkways.

    * [Visit your favorite local café and catch up with the owner.]
        You make your way to the familiar café, greeted by the warm smile of its owner, Samantha. "Hey there! Long time, no see! How's life treating you on the Celestial? Grab your favorite drink, and let's catch up!"

    * [Browse the shops and strike up a conversation with a shopkeeper.]
        Intrigued by a unique shop, you step inside and start browsing. The shopkeeper, Liam, notices your interest and begins chatting with you. "Hello! I'm Liam, and this is my little treasure trove. Feel free to look around, and if you have any questions, just let me know!"

    * [Join a group of people gathered around a street performer.]
        Drawn by the sounds of laughter and applause, you join the crowd gathered around a street performer named Maya. Her impressive juggling act and witty banter keep the audience captivated. After the performance, you have a chance to talk with her. "Hey, thanks for watching! I'm Maya, and I love bringing a little joy to people's days here in the Commercial District."

    * [Attend a business seminar to learn about starting your own venture.]
        Interested in entrepreneurship, you decide to attend a business seminar led by an experienced entrepreneur, named Victor. As he shares his insights and advice on starting a successful business on the Celestial, you find yourself inspired by the potential opportunities. After the seminar, you approach Victor to ask more questions. "Hello, I'm Victor. It's great to see someone so eager to learn about entrepreneurship! Feel free to ask me anything, and I'll do my best to help."

-
Exploring the Commercial District further, you appreciate the diverse array of experiences and people it has to offer. It's a vibrant and essential part of life on the Celestial, providing opportunities for leisure, socializing, and commerce.
-> END