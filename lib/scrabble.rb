class Scrabble
  def score(word)
    if word == nil
      point_values[word]
    else
    new_words = word.upcase.chars
    number = new_words.map do |new_word|
      point_values[new_word]
    end
    number.sum
    end
  end

  def point_values
  {
    'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2,
    'E' => 1, 'F' => 4, 'G' => 2, 'H' => 4,
    'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
    'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3,
    'Q' => 10, 'R' => 1, 'S' => 1, 'T' => 1,
    'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
    'Y' => 4, 'Z' => 10, ' ' => 0, nil => 0
  }
  end

  def score_with_multipliers(word, letter_multiplier)
     letter_multiplier[1] * letter_multiplier[1]

    require'pry';binding.pry

  end
end
