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
    return 0 if word == nil || word.length == 0
    letters = word.upcase.chars
    points = letters.map do |letter|
      point_values[letter]
    end.sum
  end

  def score_with_multipliers(word, letter_mult, word_mult = 1)
    return 0 if word == nil || word.length == 0
    letters = word.upcase.chars
    points = letters.each_with_index.map do |letter, i|
      point_values[letter] * letter_mult[i]
    end
    if word.length >= 7
      (points.sum + 10) * word_mult
    else
      points.sum * word_mult
    end
  end

end
