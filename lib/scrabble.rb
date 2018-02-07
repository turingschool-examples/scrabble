# Scores words per Scrabble rules
class Scrabble
  def score(word)
    score_per_letter = get_letter_scores(word)
    apply_modifiers(score_per_letter)
  end

  def score_with_multipliers(word, multipliers, global_mod = 1)
    score_per_letter = get_letter_scores(word)
    apply_modifiers(score_per_letter, multipliers, global_mod)
  end

  def get_letter_scores(word)
    return [0] if word.nil? || word.length.zero?
    chars = word.upcase.chars
    point_values.values_at(*chars)
  end

  def apply_modifiers(scores, multipliers = [], global_mod = 1)
    multiplied_scores = apply_multipliers(scores, multipliers)
    multiplied_scores.push 10 if scores.length >= 7
    multiplied_scores.sum * global_mod
  end

  def apply_multipliers(scores, multipliers)
    if multipliers.length == scores.length
      scores = scores.zip(multipliers).map do |score_mult|
        score_mult[1] = 1 if score_mult[1] < 1
        score_mult.inject :*
      end
    end
    scores
  end

  def highest_scoring_word(words)
    word_scores = words.map { |word| score word }
    max_score = word_scores.max
    highest_words = words.select.with_index do |_word, index|
      word_scores[index] == max_score
    end

    highest_words.sort_by(&:length).first
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
