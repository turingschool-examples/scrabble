class Scrabble
  attr_reader :word, :multiplier

  def initialize
    @word = word
    @point_values =
      {
        "A"=>1, "B"=>3, "C"=>3, "D"=>2,
        "E"=>1, "F"=>4, "G"=>2, "H"=>4,
        "I"=>1, "J"=>8, "K"=>5, "L"=>1,
        "M"=>3, "N"=>1, "O"=>1, "P"=>3,
        "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
        "U"=>1, "V"=>4, "W"=>4, "X"=>8,
        "Y"=>4, "Z"=>10, ""=>0,
      }

    @multiplier = [1, 2, 1, 1, 1]
  end

  def score(word, multiplier)
    split_word = word.upcase.chars

    total = 0
    split_word.map do |letter|
      total += @point_values[letter]
    end
    total
  end

  def score_with_multipliers(split_word, multiplier)
# require "pry"; binding.pry
    split_word.chars.map.with_index do |char, index|
      @multiplier[index]
      # require "pry"; binding.pry
    end
  end

  # def point_values
  #   {
  #     "A"=>1, "B"=>3, "C"=>3, "D"=>2,
  #     "E"=>1, "F"=>4, "G"=>2, "H"=>4,
  #     "I"=>1, "J"=>8, "K"=>5, "L"=>1,
  #     "M"=>3, "N"=>1, "O"=>1, "P"=>3,
  #     "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
  #     "U"=>1, "V"=>4, "W"=>4, "X"=>8,
  #     "Y"=>4, "Z"=>10
  #   }
  # end
end
