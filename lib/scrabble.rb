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

  def score(str, options = {})
    rules = options[:rules] || :official
    if rules == :official
      score_official(str, options)
    else
      score_psuedo(str, options)
    end
  end

  def score_official(str, options)
    result = score_with_options(str, options)
    str.length >= 7 ? result + 50 : result
  end

  def score_psuedo(str, options)
    result = score_with_options(str, options)
    mults = options[:mults] || {}
    w_mult = mults[:W] || 1
    str.length >= 7 ? result + 10 * w_mult : result
  end

  def score_with_options(str, options)
    mults = options[:mults] || nil
    return 0 if str.length == 0
    return POINTS[str.upcase] if str.length == 1
    return score_with_multipliers(str, mults) if mults
    score_word_basic(str)
  end

  def score_word_basic(word)
    word.chars.map{|c|score(c)}.sum
  end

  def score_letters(letter_inds, str)
    letter_inds.map{|i|score(str[i])}.sum
  end

  def score_with_multipliers(str, mults)
    dl_inds = mults[:DL]
    dl_score = dl_inds ? score_letters(dl_inds, str) : 0
    tl_inds = mults[:TL]
    tl_score = tl_inds ? score_letters(tl_inds, str) : 0
    letter_bonus = dl_score + tl_score * 2
    word_multiplier = mults[:W] || 1
    (score_word_basic(str) + letter_bonus) * word_multiplier
  end

end
