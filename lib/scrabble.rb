require 'pry'

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
    if word == "" || word == "nil"
      @score_array = [0]
    else
      letter_array = word.upcase.chars
      @score_array = letter_array.map do |letter|
        point_values[letter]
      end
    end
    return @score_array.sum
  end

  def score_with_multipliers(word, letter_multiplier, word_multiplier = 1)
    score(word)
    post_multi_score = @score_array.map.with_index do |score, i|
      score * letter_multiplier[i]
    end.sum
    final_score = check_for_letter_count_bonus(post_multi_score)
    return final_score * word_multiplier
  end

  def check_for_letter_count_bonus(post_multi_score)
    if @score_array.length >= 7
      post_multi_score += 10
    end
    return post_multi_score
  end

  def highest_scoring_word(word_array)
    words_and_values = create_hash_of_words_and_values(word_array)
    max_word = words_and_values.max_by do |word, score|
      score
    end
    return max_word[0]
  end

  def create_hash_of_words_and_values(word_array)
    word_score_array = word_array.map do |word|
      score(word)
    end
    Hash[word_array.zip word_score_array]
  end




  # def highest_scoring_word(word_array)
  #   score_array = word_array.map do |word|
  #     score(word)
  #   end
  #   if detect_more_than_one_highest_score(score_array)
  #     word_array[score_array.index(detect_more_than_one_highest_score)]
  #   else
  #     find_word_with_fewest_letters(word_array, score_array)
  #     word_array[score_array.max.index]
  #   binding.pry
  # end
  #
  # def detect_more_than_one_highest_score(score_array)
  #   score_array.one? do |score|
  #     score_array.max
  #   end
  # end
  #
  # def find_word_with_fewest_letters(word_array, score_array)
  #
  #
  # end

end
