import random
import sys

words = ['goku', 'light', 'sakomoto', 'mizu']

#randomly choose a word from the list 

chosen_word = random.choice(words)
word_display = ['_' for _ in chosen_word] # create a list of undscores equal lenghts to word chosen
print(word_display)
attempt = 8 # number allowed

print("Welcome to Hangman") 

#check if word display array includes at least one _ left, meaning letter left to guess
while attempt > 0 and '_' in word_display: 
    print("\n" + ' '.join(word_display))# print new line + _ in word
    guess = input("Guess a letter (or type EXIT to quit): ")#asking from user
    if guess.upper() == 'EXIT':
        print("Quitting the game...")
        sys.exit()
    guess = guess.lower()
    
    if guess in chosen_word:
        for index, letter in enumerate(chosen_word): #takes chosen word, gives access to letter and index of the letter
            if letter == guess:
                word_display[index] = guess #revaling letter
    else:
        print("That letter doesn't appear in the word - sad")
        attempt -=1 #deduct by 1 from the 8 allowed. running until attempt left
    
if '_' not in word_display:
    print("You guessed the word!")
    print(' '.join(word_display))
    print("You survived")
else:
    print("You ran out of attempts. The word was: " + chosen_word)
    print("You lost!")
    
