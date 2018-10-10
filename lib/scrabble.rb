class Scrabble
  attr_reader :alphabet

  def initialize
    @alphabet =
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

  def score(word)
    total = 0
    if word == nil
      total
      else
      letters = word.upcase.chars
      letters.map do |letter|
        total += @alphabet[letter]
      end
      total
    end
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    if score(word) != 0
     points_value_array = []
      letters = word.upcase.chars
      letters.each do |letter|
       points_value_array << @alphabet[letter]
      end
      letter_sums = letter_multiplier.zip(points_value_array).map do |multiplier, letter|
         multiplier * letter
      end
      total = 0
      letter_sum =letter_sums.sum
      total += letter_sum
      if letters.length >= 7; total += 10
      end
      total * word_multiplier
    end
  end
end
