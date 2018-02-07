require 'pry'
class Scrabble

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

  def score(word)
    total_score = 0
    if word.nil?
      total_score
    elsif word == ''
      total_score
    else
      word.each_char do |letter|
        total_score += point_values[letter.upcase]
      end
      total_score
    end
  end

  def score_with_multipliers(word, multiplier)
    binding.pry
    # break "word" apart into "W","O","R","D"
    word.upcase.each_char do |letter|
      binding.pry
    # find score of each letter
      letter_scores = score(letter)
    end
    # make zipped array of letter_scores and multiplier
    # bonus = points.zip(multiplier)
    # multiply [0][0]and[0][1] of zipped array
    binding.pry
  end
end
