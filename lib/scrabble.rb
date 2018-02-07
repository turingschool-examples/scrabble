class Scrabble
  def score(word)
    return 0 if word.nil? || word.length.zero?
    chars = word.upcase.chars
    score_per_letter = []

    until chars.empty?
      char = chars.shift
      score_per_letter.push(point_values[char]) unless point_values[char].nil?
    end

    apply_modifiers(score_per_letter)
  end

  def apply_modifiers(scores, multipliers = [], global_mod = 1)
    if multipliers.length == scores.length
      scores = scores.map.with_index do |letter_score, index|
        multiplier = multipliers[index]
        multiplier = 1 if multiplier < 1
        letter_score * multiplier
      end
    end

    total = scores.reduce :+
    total += 10 if scores.length >= 7
    total * global_mod
  end

  def score_with_multipliers(word, multipliers, global_mod = 1)
    return 0 if word.nil? || word.length.zero?
    chars = word.upcase.chars
    score_per_letter = []

    until chars.empty?
      char = chars.shift
      score_per_letter.push(point_values[char]) unless point_values[char].nil?
    end

    apply_modifiers(score_per_letter, multipliers, global_mod)
  end

  def point_values
    {
      'A' => 1, 'B' => 3, 'C' => 3, 'D' => 2,
      'E' => 1, 'F' => 4, 'G' => 2, 'H' => 4,
      'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
      'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3,
      'Q' => 10, 'R' => 1, 'S' => 1, 'T' => 1,
      'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
      'Y' => 4, 'Z' => 10
    }
  end
end
