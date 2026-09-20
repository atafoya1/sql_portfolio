import sys

questions = [
    {
        "prompt": "What is the capital of France?",
        "options": ["A. Paris", "B. London", "C. Berlin", "D. Madrid"],
        "answer": "A"
    },
    {
        "prompt": "Which language is primarily spoken in Brazil",
        "options": ["A. Spanish", "B. Portugese", "C. English", "D. French"],
        "answer": "B"
    },
    {
        "prompt": "What's the smallest prime number",
        "options": ["A. 1", "B. 2", "C. 3", "D. 5"],
        "answer": "B"
    },
    {
        "prompt": "Who wrote 'To Kill a Mockingbird",
        "options": ["A. Harper Lee", "B. Mark Twain", "C. J.K. Rowling", "D. Ernest Hemingway"],
        "answer": "A"
    }
 ]
 
def run_quiz (questions): #defining function
    score = 0 #score starts at zero
    for question in questions: #loop through questions and print each prompt
        print(question["prompt"])
        for option in question["options"]: #loop through options and print
           print(option)
        
        answer = input("Enter your answer (A, B, C, D) or type EXIT to quit: ").upper()
        
        if answer == "EXIT":
            print("Quitting the quiz...")
            sys.exit()
        
        if answer == question["answer"]:
            print("Correct, hooray!!\n") #\n tells to print empty line
            score +=1 #increments plus 1
        else:
            print("Wrong, sorry The correct answer was", question["answer"], "\n")
        
    #inserting looped score, len to print how many quesitons we had
    print(f"you got {score} out of {len(questions)} questions correct.") #print at end of quiz
            
run_quiz(questions) 

