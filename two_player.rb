require 'pry'


first_number = 3 #Math.random.round


second_number = 3 #Math.random.round

puts "Player 1: What does #{first_number} + #{second_number} equal?"
player1_answer = gets.chomp.to_i

def game
  player1_points = 3
  while player1_points > 0
    if player1_answer == (first_number + second_number)
      puts "You are correct"
      player1_points += 1
    else
      puts "You are wrong"
      player1_points -= 1
    end
    puts "You now have #{player1_points} points"
  end
end
game


game keeps going while (player1_points > 0) && (player2_points > 0)

# PSEUDOCODE

initialized: players 1 & 2 start with 3 points

method: computer selects two random numbers, assigns them first_number and second_number

method: player inputs an answer to the prompted question. method (game) does the math and adjusts your score

loop: player 1 takes a turn, program checks if player1_points > 0, then player 2 takes a turn, program checks if player2_points > 0
      if the loop breaks, print out who won and their winning score



