class Player
  attr_reader :total_score,
              :turns

  def initialize(game)
    @game = game
    @total_score = 0
    @turns = 0
  end

  def play(word)
    @total_score += @game.score(word)
    @turns += 1
  end

end
