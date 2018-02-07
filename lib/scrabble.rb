class Scrabble
  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10,
    }
  end

  def score(word)
    if word.nil? || word.empty?
      0
    else
      words = word.chars
      letter_scores = words.map do |letter|
      point_values[letter.upcase]
      end
      letter_scores.inject { |sum, n| sum + n }
    end
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier)
    words = word.upcase.chars
    array = words.zip(letter_multiplier)
    score = array.map do |subarray|
      score(subarray[0]) * subarray[1]
    end
    final_score = (score.inject { |sum, n| sum + n })
    final_score += 10 if word.length >= 7
    final_score * word_multiplier
  end
end
