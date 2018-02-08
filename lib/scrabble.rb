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
    return 0 if word == "" || word == nil
    word.chars.reduce(0) do |total, letter|
      total + point_values[letter.upcase]
    end
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    sumproduct = 0
    word.chars.each_with_index do |value, index|
      sumproduct += score(value.upcase) * letter_multiplier[index]
    end
    sumproduct += 10 if word.length >= 7
    sumproduct * word_multiplier
  end

  def highest_scoring_word(words)
    score_words = {}
    words.each do |word|
      score_words[word] = score(word)
    end
    score_words.sort_by{|key, value| value}.last[0]
  end

end
