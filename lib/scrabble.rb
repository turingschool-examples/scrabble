class Scrabble

  def initialize
    @point_values = {
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
    return 0 if word == nil
    letters = word.upcase.chars
    score = 0
    letters.each do |letter|
      score += @point_values[letter]
    end
    score
  end

  def score_with_multipliers(word, array, multiplier = 1)
    letters = word.upcase.chars
    scores = letters.map do |letter|
      score(letter)
    end
    multiplied = scores.map.with_index do |score, index|
      scores[index] * array[index]
    end
    total = 0
    total += 10 if word.length > 6
    multiplied.each do |score|
      total += score
    end
    total * multiplier
  end
end
