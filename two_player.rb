# TWO PLAYER MATH GAME
# Each player starts with 3 points, first player to 0 points loses
# Correct math answer = 1pt, wrong math answer = -1. 

require 'pry'


def numbers                           
  @first_number = 1 + Random.rand(20)
  @second_number = 1 + Random.rand(20)
end


def players(player1, player2)
  @player1 = player1
  @player2 = player2
end

# TODO: how to add in the player's name without having a method for each player?

def question
  numbers
  puts "What does #{@first_number} + #{@second_number} equal?"
  @player_answer = gets.chomp.to_i
end

# HACK: This method sucks. Refactor. Maybe even put comments somewhere else. 
# TODO: maybe a Class will fix this? This code is repeated per player. 

def turn(player1, player2)
  players(player1, player2)
  question
  if @player_answer == (@first_number + @second_number)
    puts "You, #{player1}, are correct"
    @player1_points += 1
  else
    puts "You, #{player1}, are wrong"
    @player1_points -= 1
  end
  puts "#{player1}, you now have #{@player1_points} points"

  question
  if @player_answer == (@first_number + @second_number)
    puts "You, #{player2}, are correct"
    @player2_points += 1
  else
    puts "You, #{player2}, are wrong"
    @player2_points -= 1
  end
  puts "#{player2}, you now have #{@player2_points} points"

end

# CONFIRM: tried to move the points to the 'player' section, but it didn't work

def game(player1, player2)
  players(player1, player2)
  @player1_points = 3
  @player2_points = 3
  while (@player1_points > 0) && (@player2_points > 0)
    turn(player1, player2)
  end
  winner
end

# HACK: Can this method be visually improved? 

def winner
  players(@player1, @player2)
  if (@player1_points == 0) && (@player1_points == 0)
    puts "Both players have 0 points. No one wins."
  elsif (@player1_points == 0)
    puts "#{@player2} wins with #{@player2_points} points!"
  else
    puts "#{@player1} wins with #{@player1_points} points!"
  end
end

game("Jenn", "Tigner")


# BONUS ACTIVITIES: 
#
# 1. Colourize! Add colour to your output. Bad outcomes = red and good outcomes = green.
#    Tip: Look for gems that can help make this easier for you.
#
# 2. Better Math. Instead of just prompting the user for addition questions, randomize 
#    that part too. Ask either addition, subtraction or multiplication questions.
#
# 3. Player Names. When the game starts, asks for Player 1’s name, and then Player 2’s name. 
#    From that point on, use their names instead of "Player 1" or "Player 2".
#
# 4. Restarting the Game. Instead of having to restart the ruby script, when the game 
#    finishes, ask if they want to play again and do so based on their response.
#
# 5. Player Score. Restarting the game does not ask the players for their name again, it 
#    assumes that the same people are playing again. Now you can keep track of their score 
#    and at the end of each game let them know the player scores.


