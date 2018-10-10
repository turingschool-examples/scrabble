require 'pry'
class Scrabble
  def initialize
    @point_values ={
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
    @multi_score
    @multiplier_array
    @seven_bonus = 0
  end
  def score(letter)
    if letter == nil
      0
    elsif letter == ""
      0
    else
      letter.upcase!
      @point_values[letter]
    end
  end

  def score_with_multipliers(word, array, double_word = 1)
    seven_letter_bonus(word)
    @multiplier_array = array
    letters = word.chars
    @multi_score = letters.map do |letter|
      score(letter)
    end
    letter_multiplier(@multi_score, @multiplier_array)
    ((@multi_score.sum) + @seven_bonus) * double_word
  end

  def seven_letter_bonus(word)
    if word.length >= 7
      @seven_bonus = 10
    end
  end

  def letter_multiplier(scored_array, bonus_array)
    x = 0
    scored_array.each_index do |i|
      x = bonus_array[i] * scored_array[i]
      scored_array[i] = x
    end
  end

  # def highest_scoring_word(array_of_words)
  #   word_scores = array_of_words.map do |word|
        # y = word.chars
  #     b = y.map do |letter|
        # score(letter)
      #   end
  #   end
  #   highest_score = []
  #   ((word_scores.length) - 1).times. do |x|
  #     if word_scores[x] > word_scores[x + 1]
  #       highest_score << array_of_words[word_scores[x]]
  #     else

  end





end
