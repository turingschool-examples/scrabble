require 'pry'
class Scrabble

  def initialize
   @point_values =
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
      @point_values[letter] = 0
      # elsif the letter length == 1 do this
    elsif letter == ""
      @point_values[letter] = 0
    elsif letter.length == 1
      @point_values[letter.upcase]
    else

     element_array = letter.upcase.chars.map do |element|
        @point_values[element]
      end
      element_array.size do |element|
          sum += element
      end

    end

  end
end
