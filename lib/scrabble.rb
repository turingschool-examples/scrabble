class Scrabble
  attr_reader :word
              :letter


  def initialize(word)
    @word = word
    @letter = letter
  end

  def score(@letter)
    points = []
    letter = @letter.upcase
    points << point_values[letter]
    points.sum
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

  def score_with_multipliers(word, multipliers)
    word = word.upcase
    word_array = word.split
    points = []
    letter = @letter.upcase
    points << point_values[letter]

    multiply = []
    multiply << points.map.with_index do |number, index|
        number * multipliers|index|
    end
    multiply.sum

#mutliply elements by index from points array by index from matching index in multipliers array


  end

end
