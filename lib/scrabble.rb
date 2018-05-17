class Scrabble

  POINT_VALUES = {
    "A"=>1, "B"=>3, "C"=>3, "D"=>2,
    "E"=>1, "F"=>4, "G"=>2, "H"=>4,
    "I"=>1, "J"=>8, "K"=>5, "L"=>1,
    "M"=>3, "N"=>1, "O"=>1, "P"=>3,
    "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
    "U"=>1, "V"=>4, "W"=>4, "X"=>8,
    "Y"=>4, "Z"=>10
  }

  def score(word)
    if word == nil
      0
    else
      letters = word.upcase.chars

      total = 0
      letters.each do |letter|
        total += POINT_VALUES[letter]
      end
      total
    end
  end

  def score_with_multipliers(word, points_array, word_multiplier = 1)
    if word.length
      letters = word.upcase.chars

      points = letters.map do |letter|
        POINT_VALUES[letter]
      end
    end

    points_with_associated_multiplier = points.zip(points_array)

    total = 0
    points_with_associated_multiplier.each do |numbers|
      total += numbers[0] * numbers[1]
    end

    if word.length < 7
      total *= word_multiplier
    else
      total_with_seven_letter_bonus = total += 10
      total = total_with_seven_letter_bonus *= word_multiplier
    end
    total
  end

  # def highest_scoring_word(words_array)
  #   points = words_array.map do |word|
  #     score(word)
  #   end
end
