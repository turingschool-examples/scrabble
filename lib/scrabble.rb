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
    scores = find_scores_each_letter(word)
    scores.reduce(0) do |sum, score|
      sum + score
    end
  end

  def find_scores_each_letter(word)
    letters = word.upcase.chars
    letters.map do |letter|
      @point_values[letter]
    end
  end

  def score_with_multipliers(word, array, multiplier = 1)
    scores = find_scores_each_letter(word)
    multiplied = multiply_arrays(scores, array)
    total = 0
    total += 10 if word.length > 6
    multiplied.each do |score|
      total += score
    end
    total * multiplier
  end

  def multiply_arrays(scores, array)
    scores.map.with_index do |score, index|
      score * array[index]
    end
  end
end
