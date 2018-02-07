require 'pry'

class Scrabble

  def score(word)
    if word == "" || word == nil
      points = 0
    else
      word_array = word.upcase.chars
      points = 0
      word_array.map! do |char|
        char = point_values[char]
      end
      word_array.each do |number|
        points += number
      end
    end
    points
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
