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

  def score_with_multipliers(word, letter_mult, tot_multiplier=1)
      if word == nil || word == ""
        return 0
      else
        word_arr = word_formatter(word)
        values = word_arr.map do |letter|
          point_values[letter]
        end
        score = add_score_mult(values, letter_mult)
        total_score(word, score, tot_multiplier)
      end
  end

  def add_score_mult(values, letter_mult)
    tot_values = values.zip(letter_mult).map{|val_i, mult_i| val_i * mult_i}
    tot_values.reduce :+
  end

  def total_score(word, score, tot_multiplier)
    if word.length >= 7 then score += 10 end
    score * tot_multiplier
  end

  def word_formatter(word)
    word = word.upcase
    word.chars
  end

  def word_evaulator
  end
end
