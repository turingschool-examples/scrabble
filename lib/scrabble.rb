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
      split_letters(word).each do |letter|
        score += point_values[letter]
      end
    end
    score
  end

  def score_with_multipliers(word, multipliers, double = 1)
    score = 0
    if word != nil
      letter_points = split_letters(word).map do |letter|
        point_values[letter]
      end

      letter_points.each_with_index do |points, index|
        score += points * multipliers[index]
      end
    end
    
    if word.length >= 7
      return (score + 10) * double
    end
    score * double
  end

  def split_letters(word)
    word.upcase.chars
  end


end
