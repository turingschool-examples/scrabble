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
    score = 0
    if word != nil
      split_letters(word).each do |letter|
        score += point_values[letter]
      end
    end
    score
  end

  def score_with_multipliers(word, multipliers, word_mult = 1)
    score = 0
    if word != nil
      split_letters(word).each_with_index do |letter, index|
        score += point_values[letter] * multipliers[index]
      end
    end

    if word.length >= 7
      return (score + 10) * word_mult
    end
    score * word_mult
  end

  def split_letters(word)
    word.upcase.chars
  end

  def highest_scoring_word(words)
    high_word = ""
    words.each do |word|
      if score(word) == score(high_word)
        if word.length < high_word.length
          high_word = word
        end
      elsif score(word) > score(high_word)
        high_word = word
      end
    end
    high_word
  end

end
