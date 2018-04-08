A quiz game. Challenge your vocabulary by choosing the correct definition from a list.

Ideas for expansion:

-- 2/multi player mode
-- Allowing user to chose among word lists
-- Reverse mode (get a definition and choose the word)
-- Provide only definitions of same part of speech as word

**Basic Interface:**

Welcome to Wordwise! Get ready to test your word wisdom!

What does #{@word} mean?

A) definition A
B) definition B
C) definition C
D) definition D

[User inputs guess.]

"Correct!" or "Incorrect!". Correct answer: #{fullEntry}"

"Type a word from the definition to define it, Enter for next question, or Q to quit."

On Q, user given percent of questions correct.

Icebox:

Make word entry url accessible for more info.

**Potential Enhanced Interface:**

Welcome to Wordwise! Get ready to test your word wisdom!

How many players?

[User inputs int.]

What's the name of Player 1? 

[User inputs name. 

What's the name of Player 2?

[So on till all players are named.]

#{@current_player}, what is #{@word}?

A) definition A
B) definition B
C) definition C
D) definition D

[User inputs guess.]

"Correct" or "Incorrect. Correct answer: #{correctAnswer}"

[Play goes until each player has had 10 questions and the leader is declared the winner. If no leader, "Name, Name, etc" (players tied for lead), your word wisdom is strong. Now entering Sudden Death Round! The first player, chosen at random, to answer correctly wins!. Random player asked question, etc.]