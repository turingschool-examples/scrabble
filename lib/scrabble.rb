require './lib/player'
require 'pry'

class Scrabble

  # player_1 = Player.new
  # player_2 = Player.new
  #
  # game = GameReader.new
  # # game.word_count(:player_1)  # => 3
  # # game.word_count(:player_2)  # => 2
  # game.score(:player_1)       # => 23
  # # game.score(:player_2)       # => 18

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score(letter)
    total = 0
    if letter == "" || letter == nil
      return total
    end
    letter.each_char do |char|
      total += point_values[char.upcase]
      # binding.pry
    end
    return total
  end
end
