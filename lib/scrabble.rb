class Scrabble
  attr_reader   :point_values,
                :word_hash

  def initialize
    @point_values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
    @word_hash = {}
  end

  def score_one_letter(letter)
    letter = letter.upcase
    letter = @point_values[letter]
  end

  def score(word)
    if word == nil
      return 0
    end
    scored = []
    scored = word.chars.map do |letter|
      if @point_values.include?(letter.upcase)
        score_one_letter(letter)
      else
        letter = 0
      end
    end.sum
  end

  def word_to_array(word)
    if word == nil || word == ""
      return 0
    end
    word.chars.map do |letter|
      score_one_letter(letter)
    end
  end

  def score_with_multipliers(word, value, value_2 = 1)
    zipped = word_to_array(word).zip(value)
    result = zipped.map do |pair|
      (pair[0] * pair[1]) * value_2
    end
    if result.length >= 7
      result << 10
    end
    result.sum
  end

  def word_to_hash(word)
    @word_hash[word] = score(word)
  end

  def highest_scoring_word(words)
    words.each do |word|
      word_to_hash(word)
    end
    @word_hash.sort_by do |key, value|
      value
    end
  end

end
