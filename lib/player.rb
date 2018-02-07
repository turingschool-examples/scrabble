# Describes player
class Player
  attr_reader :id,
              :score,
              :words

  def initialize(id)
    @id = id
    @score = 0
    @words = []
  end

  def add_score(score)
    @score += score
  end

  def add_word(word)
    @words.push word
  end
end
