require 'pry'
class Scrabble
  POINTS =  {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  def score(str, mults = nil)
    return score_with_multipliers(str, mults) if mults
    return 0 if str.length == 0
    if str.length == 1
      POINTS[str.upcase]
    else
      return score_word(str)
    end
  end

  def score_word(word)
    word.chars.map{|c|POINTS[c.upcase]}.sum
  end

  def score_with_multipliers(str, mults)
    score(str) * mults
  end



end
