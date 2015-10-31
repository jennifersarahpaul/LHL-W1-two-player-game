require_relative 'player'
require 'pry'
require 'colorize'

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
    @operation = [:+, :-, :*, :/].sample                  #Chooses a different operation every time
  end

# Displays the math question and gets the user's answer
  def question(currentplayer)
    numbers
    puts "#{currentplayer.name}: What does #{@first_number} #{@operation} #{@second_number} equal?"
    @player_answer = gets.chomp.to_i
    expr = "#{@first_number}"+"#{@operation}"+"#{@second_number}"        # A string of the question
    @answer = eval(expr)                     # Takes the string and evaluates it as a math question
  end

  # Outputs if the user got the right answer, and displays the new score
  def turn(currentplayer)
    question(currentplayer)
    if @player_answer == @answer
      puts "You, #{currentplayer.name}, are correct".colorize(:green)
      currentplayer.score += 1
    else
      puts "You, #{currentplayer.name}, are wrong".colorize(:red)
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
    repeat
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

# If the player wants to, play again
def repeat
  @player1.score = 3
  @player2.score = 3
  puts "Do you want to play again? (yes/no)"
  answer = gets.chomp.downcase
  rungame if answer == "yes"
end
