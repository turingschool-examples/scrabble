require 'pry'
class Scrabble
  attr_reader :point_values

  def initialize
    @point_values = {"A"=>1, "B"=>3, "C"=>3, "D"=>2,
                      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
                      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
                      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
                      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
                      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
                      "Y"=>4, "Z"=>10}
  end

  def score(word)
    sum = 0
    return sum if word.nil? || word.empty?
    
    word.upcase.chars.each do |char|
      sum += @point_values[char]
    end

    sum
  end


  def score_with_multipliers(word, letter_mult, word_mult = 1)
    sum = word.size == 7 ? 10 : 0
    word.upcase!
    return 'Invalid move' unless letter_mult.size == word.size
    
    net = word.chars.zip(letter_mult)
    net.each do |char, modifier|
      sum += (@point_values[char] * modifier)
    end

    sum * word_mult
  end
end
