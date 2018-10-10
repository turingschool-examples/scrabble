class Scrabble
  def initialize
    @point_values =
    {
      "A" => 1,
      "B" => 3,
      "C" => 3,
      "D" => 2,
      "E" => 1,
      "F" => 4,
      "G" => 2,
      "H" => 4,
      "I" => 1,
      "J" => 8,
      "K" => 5,
      "L" => 1,
      "M" => 3,
      "N" => 1,
      "O" => 1,
      "P" => 3,
      "Q" => 10,
      "R" => 1,
      "S" => 1,
      "T" => 1,
      "U" => 1,
      "V" => 4,
      "W" => 4,
      "X" => 8,
      "Y" => 4,
      "Z" => 10
    }

  end

  def score(word)
    if word.empty?
      word = 0

    elsif word.length == 1
      @point_values[word.upcase]

    else new_word = word.upcase.split(//)
    scored_word = new_word.map do |letter|
      @point_values[letter]
    end
    scored_word.sum
    end

  end

  def score_with_multipliers(word, letter_score_array, word_multiplier = 1)

    if word.length < 7
      new_word = word.upcase.split(//)
      scored_word = new_word.map do |letter|
        @point_values[letter]
      end
      combined_array = scored_word.zip(letter_score_array)
      total_points = combined_array.map do |letter, score|
        letter * score * word_multiplier
      end
      return total_points.sum


  end
end
