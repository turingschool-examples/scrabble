class Scrabble

  def initialize
    @point_values = point_values
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

  def score_single_letter(letter)
    @point_values[letter.upcase]
  end

  def score(word)
    if word == nil
      return 0
    else
    word = word.chars
    total_score = word.map do |letter|
      @point_values[letter.upcase]
    end
    end
    return total_score.sum
  end

  # def score(word)
  #   1
  # end

end
