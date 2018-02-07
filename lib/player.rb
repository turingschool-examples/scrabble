# Describes player
class Player
  attr_reader :id,
              :score

  def initialize(id)
    @id = id
    @score = 0
  end

  def add_score(score)
    @score += score
  end
end
