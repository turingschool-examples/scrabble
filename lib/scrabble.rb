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
    if word == "" || word == nil
      return 0
    end
    score_by_letter = word.upcase.chars.map do |letter|
      point_values[letter]
    end
    score_by_letter.sum
  end

  def score_with_multipliers(word, multi_array, multi = 1)
    total_score = 0
    word.chars.each_with_index do |letter, i|
      total_score += score(letter) * multi_array[i]
    end
    total_score += seven_letter_bonus(word)
    total_score *= multi
  end

  def seven_letter_bonus(word)
    if word.length >= 7
      return 10
    else
      return 0
    end
  end

  def highest_scoring_word(list)
    list.sort! { |x, y| x.length <=> y.length }
    binding.pry
    scores = []
    scores = list.map do |word|
      score(word)
    end
    list[scores.index(scores.max)]
  end

end
