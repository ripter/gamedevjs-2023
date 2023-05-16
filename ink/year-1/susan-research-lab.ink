=== Research_Lab_Mixer ===
You (the Ship AI) inform Susan of the upcoming Research Lab Mixer. She seems a bit unsure.

    - (Susan)"I'm not much of a social butterfly... Should I go?"

        * "Yes, it might be good for you to get to know your colleagues better."
            - (Susan)"Alright, I'll give it a shot. Maybe I'll even have some fun."
            -> Mixer_Attend

        * "No, you should focus on your work."
            - (Susan)"I think you're right. I've got plenty to keep me busy."
            -> Mixer_Skip

=== Mixer_Attend ===
Susan attends the mixer. The atmosphere is jovial, with colleagues chatting and laughing over drinks.

    - (Susan)"Who should I talk to first?"

        * "Talk to Dr. Langley. He's a senior researcher, and could be a valuable contact."
            - (Susan)"Dr. Langley, huh? He seems a bit intimidating, but I'll try."
            -> Langley_Conversation

        * "Talk to your fellow junior researchers. You'll have more in common with them."
            - (Susan)"Good idea. I'll start there."
            -> Junior_Researchers_Conversation

=== Mixer_Skip ===
Susan decides not to attend the mixer and spends the evening working in the lab instead.
-> Work_Night

// The conversations with Dr. Langley, the junior researchers, and the work night scenario would be written in separate sections.
