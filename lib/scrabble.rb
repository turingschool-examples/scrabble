class Scrabble

  def point_values
    {"A"=>1, "B"=>3, "C"=>3, "D"=>2,
    "E"=>1, "F"=>4, "G"=>2, "H"=>4,
    "I"=>1, "J"=>8, "K"=>5, "L"=>1,
    "M"=>3, "N"=>1, "O"=>1, "P"=>3,
    "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
    "U"=>1, "V"=>4, "W"=>4, "X"=>8,
    "Y"=>4, "Z"=>10}
  end

  def score(word)
    sum = 0
    return sum if invalid_word?(word)

    word.upcase.chars.each{ |char| sum += point_values[char] }

    sum
  end


  def score_with_multipliers(word, letter_mult, word_mult = 1)
    sum = word.size.eql?(7) ? 10 : 0
    return sum if invalid_word?(word)
    return 'Invalid move' unless letter_mult.size.eql?(word.size)

    net = word.upcase.chars.zip(letter_mult)

    net.each { |char, modifier| sum += (point_values[char] * modifier) }

    sum * word_mult
  end

  def invalid_word?(word)
    word.nil? || word.empty?
  end
end
