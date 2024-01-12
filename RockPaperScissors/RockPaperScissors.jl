# Rock 🪨, Paper 📃, Scissors ✂️ Game

function determine_winner(computer_move, human_move)
    if computer_move == human_move
        println("It's a tie! Please try again.")
    elseif (computer_move == "rock" && human_move == "scissors") ||
           (computer_move == "paper" && human_move == "rock") ||
           (computer_move == "scissors" && human_move == "paper")
        print("You lose, the computer won with $computer_move, please try again")
    else
        print("You won, the computer lost with $computer_move, nice work!")
    end
end

function play_rock_paper_scissors()
    moves = ["rock", "paper", "scissors"]
    computer_move = rand(moves)

    human_move = Base.prompt("Please enter rock, paper, or scissors")

    for move in moves 
        println("$move...")
        sleep(0.8)
    end
    
    println("Shoot!", '\n')

    determine_winner(computer_move, human_move)
end

# Run the game
play_rock_paper_scissors()