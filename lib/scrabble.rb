require 'pry'


class Scrabble

  def initialize
  end

  def score(word)
    1
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

  def value(letter)
    letter = letter.upcase
    letter_score = point_values[letter.upcase]
  end

  def score(word)
    if word == nil
      word_subtotal = 0
    else
      word_array = word.split("")
      letter_scores = word_array.map do |letter|
      value(letter)
      end
    word_subtotal = letter_scores.sum
    end
  end

  def score_with_multipliers (word, position_values)
    if word == nil
      word_subtotal = 0
    else
      #Need a way to add multiplication by value at index
      word_array = word.split("")
      letter_scores = word_array.map do |letter|
      value(letter) * position_value[count]
      count = 0
      while count < letter_score.length
        letter_score
      #word_subtotal = letter_scores.sum
    end

  end
end
