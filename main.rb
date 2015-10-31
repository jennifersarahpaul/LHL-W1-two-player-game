# TWO PLAYER MATH GAME
# Each player starts with 3 points, first player to 0 points loses
# Correct math answer = 1pt, wrong math answer = -1. 

require_relative 'player'
require_relative 'game'

puts "What is your name, player 1?"
name1 = gets.chomp.to_s
person1 = Player.new(name1, 3)

puts "What is your name, player 2?"
name2 = gets.chomp.to_s
person2 = Player.new(name2, 3)

game1 = Game.new(person1, person2)

game1.rungame