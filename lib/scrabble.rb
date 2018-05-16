
class Scrabble



  def point_values
    @point_values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10, ""=>0
    }
  end
  def score(word, position)
    if word.nil?
      0
    else
      word.upcase.chars.map do |letter|
        point_values[letter]
      end.sum
    end
  end

  def get_chars(word)
    word.upcase.chars
  end

  def it_can_score_with_multipliers(word, letter_multipliers, position)
    score = get_chars(word).map.with_index do |letter, index|
      point_values[letter] * letter_multipliers[index]
    end
    if word.length >=7
      score << 10
    end 
    score = score.sum
    score * word_multiplier
  end
end
