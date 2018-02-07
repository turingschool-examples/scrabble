require 'pry'
class Scrabble

  def score(word = nil)
    total = 0
    if word.nil?
      total
    else
      @letters = word.upcase.scan(/./)
      @letters.each do |letter|
      total += point_values[letter]
      end
    end
    total
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    if score(word) != 0
      point_value_array = Array.new
      @letters.each do |letter|
      point_value_array << point_values[letter]
      end
      letter_sums = letter_multiplier.zip(point_value_array).map{|multiplier, letter| multiplier * letter}
      total = 0
      letter_sums.each { |sum| total += sum}
      if @letters.length >= 7
        total += 10
      end
      total * word_multiplier
    end
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
