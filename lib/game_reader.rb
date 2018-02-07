class GameReader
  attr_reader :letters

  def initialize
    @letters = {"A"=>1, "B"=>3, "C"=>3, "D"=>2,
                "E"=>1, "F"=>4, "G"=>2, "H"=>4,
                "I"=>1, "J"=>8, "K"=>5, "L"=>1,
                "M"=>3, "N"=>1, "O"=>1, "P"=>3,
                "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
                "U"=>1, "V"=>4, "W"=>4, "X"=>8,
                "Y"=>4, "Z"=>10}
  end

  def score(word)
    if word == nil || word.length == 0
      0
    else
      word = seperated_word(word)
      score = word.map do |letter|
        @letters[letter]
      end
      score_addition(word, score)
    end
  end

def score_addition(word, score)
  if score == 0
    return 0
  elsif word.length < 7
    score.sum
  else
    score.sum + 10
  end
end

  def seperated_word(word)
    word.upcase.chars
  end

  def score_with_multipliers(word, multiplier_array, multiplier = 1)
    word = seperated_word(word)
    word_position = 0
    multiplier_position = 0
    result = []
    while word_position < word.length
      result << @letters[word[word_position]] * multiplier_array[multiplier_position]
      word_position += 1
      multiplier_position += 1
      end
      result
  end
end
