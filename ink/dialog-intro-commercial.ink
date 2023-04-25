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
        -> local_cafe
        

    * [Browse the shops and strike up a conversation with a shopkeeper.]
        -> meet_liam

    * [Join a group of people gathered around a street performer.]
        -> meet_maya

    * [Attend a business seminar to learn about starting your own venture.]
        -> take_seminar 

-
Exploring the Commercial District further, you appreciate the diverse array of experiences and people it has to offer. It's a vibrant and essential part of life on the Celestial, providing opportunities for leisure, socializing, and commerce.
-> END


=== local_cafe ===
As you step into the lively local café in the Commercial District, the delightful aroma of freshly brewed coffee and freshly baked pastries fills the air. Patrons chat animatedly around you, creating a warm and welcoming atmosphere.

    * [Walk up to the counter and strike up a conversation with the barista.]
        -> meet_mia
    
    * [Take a seat at a table near a group of people discussing a recent trade deal.]
        -> trade_deal
    
    * [Join the line to order a delicious beverage and pastry.]
        -> burger_time
    
    * [Spot an old acquaintance sitting by the window and approach them for a catch-up.]
        -> meet_lucy
        

=== meet_mia ===
#npc: mia

You walk up to the counter, greeted by a cheerful barista named Mia. As she prepares your order, you discuss the latest gossip and news in the Commercial District. Mia's friendly demeanor and infectious smile make you feel right at home.

    ~ triggerEvent("meet-mia")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END

=== trade_deal ===
#npc: victor

You take a seat near a group discussing a recent trade deal. As you listen, you glean valuable information about the economic climate on the Celestial. You also learn that one of the people in the group, named Victor, is a prominent merchant with extensive knowledge of the trade networks within the ship.

    ~ triggerEvent("notice-victor")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Look somewhere else.]
        ~ nextPage("ship", "dialog-intro")
        -> END
    


=== burger_time ===

As you join the line to order, you overhear a conversation between two customers about a new business venture. Intrigued, you introduce yourself and exchange contact information, forming a potential connection for future collaboration.

    ~ triggerEvent("visit-commercial-zone")

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Time to eat and then look somewhere else.]
        ~ nextPage("ship", "dialog-intro")
        -> END


=== meet_lucy ===
#npc: lucy

TIME: {timePlayer}

You spot an old acquaintance, Lucy, sitting by the window. With a smile, you approach and engage in a heartfelt conversation, reminiscing about past experiences and catching up on each other's lives. As you chat, Lucy shares valuable insights into the Commercial District's opportunities and challenges, setting the stage for your new life in this bustling area of the ship.

    ~ triggerEvent("meet-lucy")
    

    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
   
    
 
    

=== meet_liam ===
#npc: liam

As you wander around Liam's treasure trove, you're struck by the sheer variety of items on display. From trinkets and jewelry to antiques and curiosities, each item seems to have its own unique story.

    * [Ask Liam about the history of his shop and how he came to own it.]
        Curious about Liam's background, you ask him about the history of his shop. With a twinkle in his eye, he shares the tale of how he inherited the store from his grandfather and has spent years traveling the Celestial, collecting rare and unique items to sell. His passion for curating such a diverse collection is evident in every word.
        
    * [Inquire about a specific item that caught your eye.]
        You point out a fascinating item that caught your eye and ask Liam for more information. He excitedly explains its origin, detailing the journey it took to reach his store. You find yourself captivated by the tale, and your appreciation for the item deepens.
        
    * [Ask Liam for his recommendations on the best items to purchase as a gift.]
        You ask Liam for gift recommendations, and he eagerly suggests several items based on your preferences and budget. As he shows you his selections, it's clear that Liam has a keen eye for matching items to individual tastes, and you leave the shop with the perfect gift in hand.
        
    * [Thank Liam and continue browsing on your own.]
        You thank Liam for his warm welcome and continue browsing the store at your own pace. As you explore the nooks and crannies, you find yourself lost in the stories and history that each item seems to hold. The time flies by as you immerse yourself in the treasure trove, and before you know it, you've discovered a one-of-a-kind piece to take home with you.

-
    ~ triggerEvent("meet-liam")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END

=== meet_maya ===
#npc: maya
Drawn by the sounds of laughter and applause, you join the crowd gathered around a street performer named Maya. Her impressive juggling act and witty banter keep the audience captivated. After the performance, you have a chance to talk with her. "Hey, thanks for watching! I'm Maya, and I love bringing a little joy to people's days here in the Commercial District."

As Maya finishes her juggling act, the crowd erupts into cheers and applause. She takes a bow and starts packing up her props, but she notices your interest and engages you in conversation.

    * [Compliment her performance and ask her how she learned her skills.]
        You compliment Maya on her captivating performance and ask her about her training. She explains that she was taught by her older brother, who was also a performer on the Celestial. She tells you about the countless hours of practice she put in to master her craft, and her dedication to honing her skills is evident in her performance.
    
    * [Inquire about her life as a street performer and if she performs in other areas of the ship.]
        Curious about her life as a street performer, you ask Maya if she performs elsewhere on the Celestial. She tells you that she enjoys exploring the different districts and sharing her act with people from all walks of life. She mentions that her favorite spots to perform are in the Cultural and Arts District and the Outer Decks, where she can take advantage of the stunning scenery as a backdrop for her act.
    
    * [Ask her if she has any advice for someone interested in learning to juggle.]
        Interested in learning to juggle, you ask Maya if she has any tips for beginners. She gladly shares some advice, emphasizing the importance of patience and practice. She even offers to give you a quick juggling lesson on the spot. With her guidance, you're soon able to keep three balls in the air, and you leave the encounter feeling inspired to continue practicing.
    
    * [Thank her for the entertainment and wish her luck with her future performances.]
        You thank Maya for her entertaining performance and wish her the best of luck in her future acts. She smiles and thanks you for your support. As you leave, you can't help but feel a sense of joy from the brief encounter, and you find yourself looking forward to the next time you come across one of Maya's lively performances.
        
-
    ~ triggerEvent("meet-maya")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END

    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
    
    

=== take_seminar ===

Inclined toward the prospect of self-employment, you find yourself drawn to a business seminar led by a seasoned entrepreneur named Victor. He's got the air of a man who's seen a hundred business deals and probably bested them all.

With great anticipation, you settle into a seat in the seminar room as Victor takes the stage. There's a twinkle in his eye as he regales the audience with tales of commerce and capitalism on the Celestial, each anecdote more preposterous and yet somehow more believable than the last. You can't help but be swept up in the potential opportunities lurking within these fantastical tales.

As the seminar concludes, you opt for a moment of quiet reflection rather than approach Victor directly. After all, it's essential to let the wisdom percolate, like a fine tea steeping in the depths of your mind. You meander through the bustling Commercial District, your brain abuzz with newfound aspirations of entrepreneurial greatness.

    ~ triggerEvent("notice-victor-suspect")
    
    * {timePlayer >= 2} [It's been a long day, time to go home.]
        ~ nextPage("dialog", "dialog-day-two")
        -> END
   
    * {timePlayer < 2} [Reluctantly go learn about another area.]
        ~ nextPage("ship", "dialog-intro")
        -> END
    } 
    
    
    
    
-
-> END