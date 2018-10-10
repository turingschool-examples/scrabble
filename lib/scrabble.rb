require "pry"
class Scrabble
  attr_reader :point_values, :scored_letters
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
    @scored_letters = scored_letters
  end

  def score(word)
    letters_to_score = word.upcase.chars
    @scored_letters = letters_to_score.map do |letter|
     @point_values[letter]
    end
    sum = 0
    total_value = @scored_letters.map {|score| sum+=score}
  end
end
