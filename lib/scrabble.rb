class Scrabble

  def score(word)
    if word == nil || word == ""
      return 0
    end
    letter_arr = word.upcase.chars
    score_total = 0
    letter_arr.each do |letter|
      score_total += point_values[letter]
    end
    score_total
  end

  def score_with_multipliers(word, letter_mult , word_mult = 1)
    if word == nil || word == ""
      return 0
    end
    letter_arr = word.upcase.chars
    score_total = 0
    letter_arr.each_with_index do |letter, index|
      score_total += point_values[letter] * letter_mult[index]
    end
    if word.length >= 7
      score_total += 10
    end
    score_total * word_mult
  end

  def highest_scoring_word(word_arr)
    high_word = []
    word_arr.each do |word|
      if score(word) > score(high_word[0])
        high_word = [word]
      elsif score(word) == score(high_word[0])
        high_word << word
      end
    end
    words_ascending = high_word.sort_by {|word| word.length}
    highest = ""
    if high_word.select {|word| word.length >= 7} != []
      highest = high_word.select {|word| word.length >= 7}[0]
    elsif high_word.all?{|word| word.length == high_word[0]}
      highest = words_ascending[0]
    else
      highest = high_word.min_by {|word| word.length}
    end
    highest
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
