class Scrabble
  attr_reader :point_values
  def initialize
    @point_values = {
      'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2,
      'E' => 1, 'F' => 4, 'G' => 2, 'H' => 4,
      'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
      'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3,
      'Q' => 10, 'R' => 1, 'S' => 1, 'T' => 1,
      'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
      'Y' => 4, 'Z' => 10, 'HELLO' => 8, '' => 0,
      'NIL' => 0
    }
  end

  def score(value)
    upper_case = value.upcase
    acceptable = upper_case.split(//).join
    translate = @point_values[acceptable]
    translate
  end

  def score_with_multipliers(*args)
    argument_array = args[1]
    sum_of_array = argument_array.sum
    multiplier = args[2]
    value = multiplier * sum_of_array.to_f
    value
  end
end
