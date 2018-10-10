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

  def score(str, options = nil)
    options ? score_with_options(str, options) : score_word(str)
  end

  def score_with_options(str, options)
    mults = options[:mults] || nil
    recurring = options[:recurring] || false
    return 0 if str.length == 0
    return score_with_bingo(str, mults) if str.length >= 7 && !recurring
    binding.pry if str == "amazing" && mults == 2
    return score_with_multipliers(str, mults) if mults
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
    score(str) * mults[:DW]
  end

  def score_with_bingo(str, mults)
    score(str, mults, :recurring) + 50
  end


end
