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
    total_score = 0
    return total_score if word == '' || word == nil
    word.chars.each do |letter|
      total_score += point_values[letter.upcase]
    end
    total_score
  end

  def score_with_multipliers(word, multiplier, word_multiplier = 1)
    total_score = 0
    total_score += 10 if word.length >= 7
    return total_score if word == '' || word == nil
    combined_array = combine_arrays(word, multiplier)
    combined_array.each do |pair|
      total_score += score(pair[0]) * pair[1]
    end
    total_score *= word_multiplier
  end

  def combine_arrays(word, multiplier)
    array = []
    until array.length == word.length
      array << [word[array.length], multiplier[array.length]]
    end
    array
  end
end

# binding.pry
