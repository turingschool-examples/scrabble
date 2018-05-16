
class Scrabble
  attr_reader :word,
              :point_values,
              :position,
              :score

  def initialize(word, position)
    @word = word
    @point_values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10, ""=>0
    }
    @score = []
    @position = position

  end

  def score(word, position)
    @point_values[word.upcase]
  end

  def it_can_score_with_multipliers(word, position)
    split_word = word.split("")
    split_word.map do |letter|
      letter.upcase
      @score << @point_values[letter.upcase[0]]
      @score << @point_values[letter.upcase[1]]
      @score << @point_values[letter.upcase[2]]
      @score << @point_values[letter.upcase[3]]
      @score << @point_values[letter.upcase[4]]

    end
  end
end
