# Rock 🪨, Paper 📃, Scissors ✂️ Game

# Determine and display the winner
function determine_winner(computer_move::AbstractString, human_move::AbstractString)
    if computer_move == human_move
        # If both moves are the same, it's a tie
        println("It's a tie! Please try again.")
    elseif (computer_move == "rock" && human_move == "scissors") ||
           (computer_move == "paper" && human_move == "rock") ||
           (computer_move == "scissors" && human_move == "paper")
        # If the computer wins based on move combinations, notify the user
        print("You lose, the computer won with $computer_move, please try again")
    else
        # If none of the above conditions are met, the human wins
        print("You won, the computer lost with $computer_move, nice work!")
    end
    
    println('\n')
end

# Function to play the Rock, Paper, Scissors game
function play_rock_paper_scissors()
    # Possible moves in the game
    moves = ["rock", "paper", "scissors"]

    # Randomly select a move for the computer
    computer_move = rand(moves)

    # Prompt the user to enter their move
    human_move = Base.prompt("Please enter rock, paper, or scissors")

    # Displaying countdown before revealing moves
    for move in moves 
        println("$move...")
        sleep(0.8)
    end
    println("Shoot!", '\n')

    determine_winner(computer_move, human_move)
end

# Run the game
play_rock_paper_scissors()