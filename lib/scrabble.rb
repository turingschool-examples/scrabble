class Scrabble
  attr_reader     :point_values,
                  :counter

  def initialize
    @point_values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10, " "=>0, nil=>0
    }
    @counter      = []
  end

  def score(word)
    if word == nil
      return 0
    end
    new_word = word.upcase
    new_word.chars.each do |letter|
      @counter << @point_values[letter]
    end
    new_count = @counter.inject(0){|sum, num| sum + num}
    new_count
  end

  def score_with_multipliers(word, multi, double = 1)
    total = (score(word) + multi[0]) * double
    total
    # new_word = word.upcase
    # count = new_word.chars.each_with_index.map do |letter, index|
    #   @point_values[letter] * multi[index]
    # end
    # if word.length > 6
    #   (count.inject(0){|sum, num| sum + num + 10}) * multi
    # else
    #   (count.inject(0){|sum, num| sum + num}) * multi
    # end

    # i don't understand what this mutli array is doing
  end

  def highest_scoring_word(arr_words)
    new_hash = {}
    arr_words.each do |word|
      new_hash[score(word)] = word
    end
    new_hash
  end
end
