require 'pry'
require './lib/player'

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
    score = 0
    if word != nil
      word_array = word.chars
      word_array.each do | letter |
        score += point_values[letter.upcase]
      end
    end
    score
  end

  def  score_with_multipliers(word, multipliers, total_multiplier = 1)
    score = 0
    if word != nil
      if word.length >= 7
        score += 10
      end
      word_array = word.chars
      word_array.each_with_index do | letter, index |
        points = point_values[letter.upcase] * multipliers[index]
        score += points
      end
      score *= total_multiplier
    end
    score
  end

  def highest_scoring_word(words)
    scores = {}
    words.each do | word |
      scores[word] = score(word)
    end
    tied_words = []
    scores.keys.each do | word |
      if scores[word] == scores.values.max
        tied_words.push(word)
      end
    end

    tied_words.sort_by! do | word |
      word.length
    end

    if tied_words.last.length == 7
      return tied_words.last
    else
      return tied_words.first
    end
  end
end
