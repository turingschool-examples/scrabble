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
    if word == nil || word == ""
      return 0
    else
      word = word.upcase
      word_arr = word.chars
      values = word_arr.map do |letter|
        point_values[letter]
      end
      add_score(values)
    end
  end

  def add_score(values)
    values.reduce :+
  end

  def score_with_multipliers(word, letter_mult)
      if word == nil || word == ""
        return 0
      else
        word = word.upcase
        word_arr = word.chars
        values = word_arr.map do |letter|
          point_values[letter]
        end
        add_score_mult(values, letter_mult)
      end
  end

  def add_score_mult(values, letter_mult)
    binding.pry
    tot_values = values.zip(letter_mult).map{|val_i, mult_i| val_i * mult_i}
    binding.pry
    tot_values.reduce :+
  end
end
