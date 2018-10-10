require 'pry'

class Scrabble

  def score(word)
    return 0 if word == "" || word == nil
    return "Invalid Input" if not word.class == String
    return point_values[word.upcase] if word.length == 1
    score_with_no_multipliers(word)
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

  def score_word_with_no_multipliers(word)
    letters = word.chars
    final_score = letters.reduce(0) do |sum, letter|
      sum += point_values[letter.upcase]
    end
  end

  def score_word_with_multipliers(word, letter_multipliers)
    letters = word.chars
    final_score = letters.each_with_index.reduce(0) do |sum, (letter, index)|
      sum += point_values[letter] * letter_multipliers[index]
    end
  end

  def score_with_multipliers(word, letter_multipliers, word_multiplier)
    word_length = word.length
    return "Invalid letter multipliers" if not word_length == letter_multipliers.length

    score = word_length >= 7 ? 10 : 0


  end
end
