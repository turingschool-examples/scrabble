require './lib/player'
require 'pry'

class Scrabble

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

  def score(word)
    total = 0
    if word == "" || word == nil
      return total
    end
    word.each_char do |char|
      total += point_values[char.upcase]
    end
    return total
  end

  def score_with_multipliers(word, letter_multipliers, word_multiplier=1)
    total = 0
    i = 0
    if word == "" || word == nil
      return total
    end
    word.each_char do |char|
      total += point_values[char.upcase] * letter_multipliers[i] * word_multiplier
      i += 1
    end
    return total
  end
end
