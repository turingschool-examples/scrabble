class Scrabble

  def score(word)
    if word == nil || word == '' then return 0 end

    # score = 0
    # word.each_char do |c|
    #   puts c.class
    #   score += point_values[c.upcase]
    # end
    #
    # score

    word.each_char.reduce(0) do |sum, c|
      sum + score_char(c)
    end
  end

  def score_char(c)
    point_values[c.upcase]
  end

  def score_with_multipliers(word, letter_arr, mult = 1)
    if word == nil || word == '' then return 0 end

    sum = 0
    word.split('').each_with_index do |c, index|
      sum += letter_arr[index] * score_char(c)
    end
    if(word.length >= 7)
      sum += 10
    end
    sum = mult * sum
  end

  def highest_scoring_word(arr)
    highest_score = 0
    highest_word = ''
    arr.each do |word|
      word_score = score(word)
      if word_score > highest_score
        highest_score = word_score
        highest_word = word
      elsif word_score == highest_score
        # test word lengths
        if highest_word.length <= word.length
          if word.length >= 7 && highest_word.length < 7
            highest_word = word
          end
        else
          highest_word = word
        end
      end
    end
    highest_word
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
