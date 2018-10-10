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


    if word == nil
      return nil
    else
      letters = word.chars

      return_score = letters.map do |score|
        score_it = score.upcase
        point_values[score_it]
      end
    end

    final_score = return_score.sum

    final_score
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)

    if word == nil
      return nil
    else
      letters = word.chars
      word_length = word.length

      return_score = letters.map do |score|
        score_it = score.upcase
        point_values[score_it]
      end

      x = 0

      final_score = return_score.map do |score|
        returned = score * letter_multiplier[x]
        x += 1
        returned
      end


    end

    if word_length > 6
      store_score_length = final_score.sum
      final_score = store_score_length + 10
      final_score * word_multiplier
    else
      final_score.sum * word_multiplier
    end



  end
end
