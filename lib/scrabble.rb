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

  def score(letter)
    if letter == nil
      0
    elsif letter.length == 1
      point_values[letter.upcase]
    else
      new_array = letter.upcase.split('')
      conversion = new_array.map do |i|
        point_values[i]
        end
      conversion.sum
    end

  end

  def score_with_multipliers(letter, letter_score, word_score = 1)
    new_array = letter.upcase.split('')
    conversion = new_array.map do |i|
      point_values[i]
      end
    @new_calculation = conversion.zip(letter_score).map do |x, y|
      x * y
    end
    if letter.length > 6
      (@new_calculation.sum + 10) * word_score
    else
      @new_calculation.sum * word_score
    end 
  end

end
