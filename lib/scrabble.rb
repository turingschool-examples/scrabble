require 'pry'
class Scrabble

  def score(word)
    word = nil_value(word)
    letters = word.upcase.chars
    scoring = letters.map do |letter|
      point_values[letter]
    end
    scoring.sum
  end

  def score_with_multipliers(word, position, bonus=1)
    assigned_multipliers = word.chars.zip(position)
    scores = assigned_multipliers.map do |pair|
      score(pair[0]) * pair[1]
    end
    if scores.length < 7
      scores.sum * bonus
    else
      (scores.sum + 10) * bonus
    end
  end

  def nil_value(data)
    if data == nil
      ""
    else
      data = data
    end
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
