# Plays Scrabble
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
    if word.nil?
      0
    else
      letters = word.upcase.chars
      points_array = letters.map { |letter| point_values[letter] }
      points_array.sum
    end
  end

  def score_with_multipliers(word, position_score, word_multiplier = 1)
    if word.nil?
      0
    elsif word.length < 7
      multiply_no_bonus(word, position_score, word_multiplier)
    else
      multiply_with_bonus(word, position_score, word_multiplier)
    end
  end

  def multiply_no_bonus(word, position_score, word_multiplier)
    letters = word.upcase.chars
    points_array = letters.map { |letter| point_values[letter] }
    zipped_letters = points_array.zip(position_score)
    scores_to_sum = zipped_letters.map do |zipped_letter|
      zipped_letter[0] * zipped_letter[1]
    end
    scores_to_sum.sum * word_multiplier
  end

  def multiply_with_bonus(word, position_score, word_multiplier)
    letters = word.upcase.chars
    points_array = letters.map { |letter| point_values[letter] }
    zipped_letters = points_array.zip(position_score)
    scores_to_sum = zipped_letters.map do |zipped_letter|
      zipped_letter[0] * zipped_letter[1]
    end
    (scores_to_sum.sum + 10) * word_multiplier
  end
end
