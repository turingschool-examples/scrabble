require 'pry'
class Scrabble

  def score(word)
    return 0 if word == nil
    score = calculate_points(word)
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

  def format_word(word)
    word.upcase.chars
  end

  def calculate_points(word)
    points = []
    format_word(word).map do |letter|
      points << point_values[letter]
    end
    points.sum
  end

  
  def score_with_multipliers(word, letter_mult = nil, word_mult = nil)
    split_word = format_word(word)
    array = split_word.zip(letter_mult)
    array.map do |subarray|
      calculate_points(subarray[0]) * subarray[1]
    end.sum
  end
end
