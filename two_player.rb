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


def question
  numbers
  puts "What does #{@first_number} + #{@second_number} equal?"
  @player_answer = gets.chomp.to_i
end


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


def game(player1, player2)
  players(player1, player2)
  @player1_points = 3
  @player2_points = 3
  while (@player1_points > 0) && (@player2_points > 0)
    turn(player1, player2)
  end
  puts "#{@player} wins with #{@player_points}!"
end

game("Jenn", "Tigner")





# Remember to also seperate your I/O (Input/output) methods from your logic methods. 
# Logic methods will not use puts or gets and instead change the state of the game or perform 
# other logic that other methods will perhaps tell or ask the user about.




