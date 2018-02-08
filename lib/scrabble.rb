class Scrabble
require 'pry'
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
    return 0 if word.nil?

    word.upcase.chars.map do |letter|
      point_values[letter]
    end.sum + seven_letter_bonus(word)

  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    return 0 if word.nil?

    word_sum = word.upcase.chars.each_with_index.map do |letter, index|
      point_values[letter] * letter_multiplier[index]
    end.sum * word_multiplier

    word_sum + seven_letter_bonus(word)
  end

  def seven_letter_bonus(word)

    if word.length == 7
       50
    else
      0
    end
  end
end
