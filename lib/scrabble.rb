class Scrabble

  def score(word)
    if word == nil
      return 0
    else
      scores = []
      upper_case_letters = word.upcase.split("")
      upper_case_letters.each do |letter|
        scores << point_values[letter]
      end
    end
    bonus = seven_letter_bonus?(scores)
    return scores.sum + bonus
  end

  def score_with_multipliers(word, letter_multipliers, word_multiplier = 1)
    if word == nil
      return 0
    else
      scores_with_multipliers = []
      upper_case_letters = word.upcase.split("")
      upper_case_letters.each_with_index do |letter, index|
        scores_with_multipliers << point_values[letter] * letter_multipliers[index]
      end
    end
    bonus = seven_letter_bonus?(scores_with_multipliers)
    return (scores_with_multipliers.sum + bonus) * word_multiplier
  end

  def seven_letter_bonus?(scores)
    if scores.length > 6
      return 10
    else
      return 0
    end
  end

  def highest_scoring_word(words)
    words_sorted_by_length = words.sort_by {|word| -(word.length)}
    words_sorted_by_score = words_sorted_by_length.sort_by {|word| score(word)}
    return words_sorted_by_score.pop
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
