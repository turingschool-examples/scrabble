require "./scrabble"

p "hey, what word would you like to add?"
word = gets.chomp.downcase

game = Scrabble.new

p game.score(word)
