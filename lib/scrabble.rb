require 'pry'

class Scrabble
  attr_reader :input

  def initialize
  end

  def score(word)
    word = '' if word == nil
    word = word.upcase.chars
    values = word.map do |letter|
      point_values[letter]
    end
    total = values.sum
    total
  end

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

  def score_with_multipliers(word, multipliers, word_mult = 1)
    word = word.upcase.chars
    let_mult = Hash[word.zip(multipliers)]
    values =[]
    values << 10 if word.length >= 7
    word.each do |letter|
      values << (point_values[letter] * let_mult[letter])
    end
    total = values.sum
    total * word_mult
  end

  def highest_scoring_word(words)
    values = words.map do |word|
      score(word)
    end
    matched = Hash[words.zip(values)]
    max = matched.values.max
    winner = matched.key(max)
    winner
  end

end
