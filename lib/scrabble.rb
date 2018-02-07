require_relative 'word_finder'

# scrabble scoring class
class Scrabble
  def initialize
    @finder = WordFinder.new
  end

  def score(word)
    if !word || !@finder.exists?(word)
      return 0
    end
    letters = word.upcase.chars
    total = 0
    letters.each do |letter|
      total += point_values[letter]
    end
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

  def score_with_multipliers(word, multipliers, word_multiplier = 1)
    if !word || !@finder.exists?(word)
      return 0
    end
    letters = word.upcase.chars
    if letters.length != multipliers.length
      nil
    else
      total = 0
      (0..letters.length - 1).each do |i|
        total += point_values[letters[i]] * multipliers[i]
      end
      if word.length == 7
        total += 10
      end
      total * word_multiplier
    end
  end

  def highest_scoring_word(words)
    highest = words[0]
    words.each do |word|
      if word.length == 7
        highest = word
        break
      end
      if score(word) > score(highest)
        highest = word
      elsif score(word) == score(highest) && word.length < highest.length
        highest = word
      end
    end
    highest
  end
end
