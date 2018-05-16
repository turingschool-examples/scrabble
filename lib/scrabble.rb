class Scrabble

  def score(word)
    total = 0
    if word
      uppercase = word.upcase
      word_array = uppercase.chars

      word_array.each do |letter|
        total += point_values[letter]
      end
      if word.length >= 7
        total += 10
      end
    end
    total
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

  def score_with_multipliers(word, multiplier_array, word_multiplier = 1)
    total = 0
    letter_array = word.chars
    letter_array.each.with_index do |letter, index|
      total += multiplier_array[index] * score(letter)
    end
    if word.length >= 7
      total += 10
    end
    total * word_multiplier
  end

  def highest_scoring_word(word_array)
    words_with_scores_array = []
    word_array.each do |word|
      temp_score = score(word)
      words_with_scores_array << {:word => word, :score => temp_score}
    end
    words_with_scores_array.sort_by! do |word_hash|
      word_hash[:score]
    end
    max_score = words_with_scores_array[-1][:score]
    highest_scoring_words = words_with_scores_array.select do |word_hash|
      word_hash[:score] == max_score
    end
    if highest_scoring_words.length == 1
      return highest_scoring_words[0][:word]
    else
      shortest_word = "this is a placeholder for a long string"
      highest_scoring_words.each do |word_hash|
        if word_hash[:word].length == 7
          return word_hash[:word]
        elsif word_hash[:word].length < shortest_word.length
          shortest_word = word_hash[:word]
        end
      end
      return shortest_word
    end

  end

end
