class Scrabble
  attr_reader  :point_values, :caps

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
    @caps = []
  end

  def score(word)
    if word.class == String
      caps_letters = word.upcase.chars
      caps_letters.each do |letter|
        @caps << @point_values[letter]
      end
      p @caps.sum
    else
      return 0
    end
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    caps_letters = word.upcase.chars
    caps_letters.each do |letter|
      @caps << @point_values[letter]
    end
    shifted_letters = []
    @caps.each do |i|
      shifted_letters << i * letter_multiplier.shift
    end
    if shifted_letters.count >= 7
      (shifted_letters.sum + 10) * word_multiplier
    else
      shifted_letters.sum * word_multiplier
    end
  end

  def highest_scoring_word(words)
    array_1 = []
    array_2 = []
    array_3 = []
    #take every word being passed as an argument and make it upcase
    #then store each upcase word in array_1 with every letter separated
    words.each do |x|
      array_1 << x.upcase.chars
    end
    array_1 #[["H", "O", "M", "E"], ["W", "O", "R", "D"], ["H", "E", "L", "L", "O"], ["S", "O", "U", "N", "D"]]
    array_1.each do |x|
      #convert each letter to the @point_values key
      x.each do |letter|
        array_2 << @point_values[letter]
        array_2.each do |y|
          array_3 << y.sum
        end
      end
      #now we have array_1 = [[4, 1, 3, 1], [4, 1, 1, 2], [4, 1, 1, 1, 1], [1, 1, 1, 1, 2]]
      #we need to turn every element.sum
      array_1
    end
    #now we have array_2 =






  end
end
