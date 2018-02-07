class Scrabble

  def score(word)
    return 0 if word.nil?
    letters = word.upcase.chars
    letters.map do |letter|
      point_values[letter]
    end.sum
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

  def score_with_multipliers(word, position_mults, word_mult = 1)
    scoring_array = word.chars.zip(position_mults)
    sub_total = scoring_array.map do |element|
      score(element[0]) * element[1]
    end.sum
    sub_total += 10 if word.length > 6
    sub_total * word_mult
  end
end
