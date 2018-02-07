require './lib/dictionary'
require 'pry'

class Scrabble

  def score(word)
    return nil if word == nil || word == ""
    word.split("").map do |letter|
      point_values[letter.upcase]
    end.sum
  end

  def score_with_multipliers(word, bonus = nil, multiplier = 1)
    return nil if word == nil || word == ""
    total_score = bonus_multiplier(word, bonus, multiplier)
    total_score += length_bonus(word)
  end

  def bonus_multiplier(word, bonus = nil, multiplier = 1)
    return nil if word == nil || word == ""
    word.split("").map.with_index do |letter, index|
      score(letter) * bonus[index]
    end.sum * multiplier
  end

  def length_bonus(word)
    return 10 if word.split("").length >= 7
    return 0
  end

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
end
