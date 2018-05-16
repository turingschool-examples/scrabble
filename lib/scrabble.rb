class Scrabble

  def initialize
    @point_values = point_values
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

  def score_single_letter(letter)
    @point_values[letter.upcase]
  end

  def score(word)
    if word == nil
      return 0
    else
    word = word.chars
    total_score = word.map do |letter|
      @point_values[letter.upcase]
    end
    end
    return total_score.sum
  end

  def score_letter_with_multiplier(letter, multiplier)
    @point_values[letter.upcase] * multiplier
  end

  def score_with_multipliers(word, multiplier, word_mult = 1)
    word = word.chars
    total_score = word.map do |letter|
      @point_values[letter.upcase]
    end
    mult_array_score = total_score.map.with_index do |element, index|
      element * multiplier[index]
    end
    sum_letter_mult = mult_array_score.sum

    if word.length < 7
      bonus_word = sum_letter_mult
    elsif word.length >= 7
      bonus_word = sum_letter_mult + 10
    end
     # binding.pry
    if word_mult == 1 || word_mult == 0
      bonus_word
    else
      bonus_word * word_mult
    end
  end

end
