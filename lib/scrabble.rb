class Scrabble
  LIB = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }


  def score(letters)
    if letters == nil
      return 0
    else
    new_letters = letters.upcase.chars
    valuator =  new_letters.map do |x|
                LIB[x]
                end
    return valuator.sum
  end
  end

  def multipliers(word, multiplier, bonus = 1)
    if word.length < 7
    new_letters = word.upcase.chars
    valuator =  new_letters.map do |x|
                LIB[x]
                end
    multiply =  valuator.zip(multiplier).map{|x,y| x * y}

   return  (multiply.sum) * bonus

    elsif
      new_letters = word.upcase.chars
      valuator =  new_letters.map do |x|
                  LIB[x]
                  end
    seven_letter_bonus =  valuator.zip(multiplier).map{|x,y| x * y}
    multiply = (seven_letter_bonus.sum) + 10

    return(multiply) * bonus
  end
  end

  # def highest_scoring_word(word_array)
  #  #split word array into individual Words
  #  #for each run method multipliers
  #  #create comparison statment
  #
  # end

end
