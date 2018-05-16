class Scrabble
  def score(word)
    if word
      word = word.upcase.chars
      word.inject(0) { |score, letter| score + point_values[letter] }
    else
      0
    end
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

  def score_with_multipliers(word, letter_multiple, word_multiple=1)
    if word
      score = 0
      word = word.upcase.chars
      default_values = word.map { |letter| point_values[letter] }
      word.length.times do |value|
        score += (default_values[value] * letter_multiple[value])
      end
      score += 10 if word.length == 7
      score = score * word_multiple
    else
      0
    end
  end

  def highest_scoring_word(word_list)
    # There should be word objects that have attributes
    # score and the word itself.
    # word_list will hold these objects and be able to return
    # word.score and word.english_spelling_of_the_word
  end
end
