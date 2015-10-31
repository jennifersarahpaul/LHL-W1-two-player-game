require_relative 'player'
require 'pry'

class Game

  # Initialize each game to have two players
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  # Computer generates two numbers for the question
  def numbers                           
    @first_number = 1 + Random.rand(20)
    @second_number = 1 + Random.rand(20)
  end

# Displays the math question and gets the user's answer
  def question(currentplayer)
    numbers
    puts "#{currentplayer.name}: What does #{@first_number} + #{@second_number} equal?"
    @player_answer = gets.chomp.to_i
  end

  # Outputs if the user got the right answer, and displays the new score
  def turn(currentplayer)
    question(currentplayer)
    if @player_answer == (@first_number + @second_number)
      puts "You, #{currentplayer.name}, are correct"
      currentplayer.score += 1
    else
      puts "You, #{currentplayer.name}, are wrong"
      currentplayer.score -= 1
    end
    puts "#{currentplayer.name}, you now have #{currentplayer.score} points"
  end

# This is the method called to play
# Loops through turns until one player reaches 0
  def rungame
    while (@player1.score > 0) && (@player2.score > 0)
      turn(@player1)
      turn(@player2)
    end
    winner(@player1, @player2)
  end

# Displays the winner and their final score
  def winner(player1, player2)
    if (player1.score == 0) && (player2.score == 0)
      puts "Both players have 0 points. No one wins."
    elsif (player1.score == 0)
      puts "#{player2.name} wins with #{player2.score} points!"
    else
      puts "#{player1.name} wins with #{player1.score} points!"
    end
  end
end



# BONUS ACTIVITIES: 
#
# 1. Colourize! Add colour to your output. Bad outcomes = red and good outcomes = green.
#    Tip: Look for gems that can help make this easier for you.
#
# 2. Better Math. Instead of just prompting the user for addition questions, randomize 
#    that part too. Ask either addition, subtraction or multiplication questions.
#
# 4. Restarting the Game. Instead of having to restart the ruby script, when the game 
#    finishes, ask if they want to play again and do so based on their response.
#
# 5. Player Score. Restarting the game does not ask the players for their name again, it 
#    assumes that the same people are playing again. Now you can keep track of their score 
#    and at the end of each game let them know the player scores.
