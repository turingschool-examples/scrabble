class Scrabble
  attr_reader :word 

  def initialize
    @word = word
  end 

  def score(word)
    if word == nil || word == ""
      0
    else
      sliced_word = word.upcase.split("")
      sliced_word.map do |letter|
        point_values[letter]
      end.compact.sum
    end
  end

  def score_with_multipliers(word, board, multiplier = 1)
    board.map do |letter_score|
      word.upcase.split('').map do |letter|
        point_values[letter]
      end
      word[letter_score] * board[letter_score]
      # require 'pry'; binding.pry
    end 

    # letters = word.upcase.split("")
    # index = 0
    # letters.map do |letter|
    #   point_values[letter] * board[index]
    # # end
    # # index = 0
    # # scores.map do |score|
    # #   scores[index] 
    # index +=1
    # end.sum * multiplier
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
