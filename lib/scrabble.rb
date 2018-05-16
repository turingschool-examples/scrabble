class Scrabble

  def score(guess_word)
    guess_word_split = take_word(guess_word)
    total_score = assign_point_values(guess_word_split)
    p total_score
  end


  def take_word(word)
    if word == " "
      p 0
    elsif word == '0'
      p 0
    elsif
    string = word.to_s
    array = string.chars
    end
  end

    def assign_point_values(split_word)
      point_values =     {
            "A"=>1, "B"=>3, "C"=>3, "D"=>2,
            "E"=>1, "F"=>4, "G"=>2, "H"=>4,
            "I"=>1, "J"=>8, "K"=>5, "L"=>1,
            "M"=>3, "N"=>1, "O"=>1, "P"=>3,
            "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
            "U"=>1, "V"=>4, "W"=>4, "X"=>8,
            "Y"=>4, "Z"=>10
          }

          score = []
          value_0 = point_values[split_word[0]]
          value_1 = point_values[split_word[1]]
          value_2 = point_values[split_word[2]]
          value_3 = point_values[split_word[3]]
          value_4 = point_values[split_word[4]]
          score << value_0
          score << value_1
          score << value_2
          score << value_3
          score << value_4
          word_total_score = score.sum
    end


end
Scrabble.new.score(" ")
