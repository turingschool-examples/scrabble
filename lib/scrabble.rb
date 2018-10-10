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
      word.each_char { |letter| score += point_values[letter.upcase] }
    end
    score
  end

  def score_with_multipliers(word, multipliers, doubler = 1)
    score = 0
    if word != nil && word != ""
      index = 0
      word.length.times do
        score += point_values[word.chars[index].upcase] * multipliers[index]
        index += 1
      end
    end
    score = score + 10 if word.length >= 7
    score * doubler
  end

  def highest_scoring_word (words)
    return words[0] if words.length == 1
    winning_index = 0
    test_index = 1
    (words.length - 1).times do
      if score(words[winning_index]) < score(words[test_index])
        winning_index = test_index
      elsif score(words[winning_index]) == score(words[test_index])
        winning_index = winning_index
        #break_tie(words[winning_index], words[test_index])
      end
      test_index += 1
    end
    words[winning_index]
  end

  def break_tie(word_1, word_2)
    if score.word_1 = score.word_2 && word_1.length == word_2.length
      {return ":word_1"}
    if word_1.length == 7 {return ":word_1"}
    if word_2.length == 7 {return ":word_2"}
    if word_1.length <= word_2.length
      return ":word_1
    else
      return "word_2"
    end
  end

end
