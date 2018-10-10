class Player
  def initialize(game)
    @game = game
    @score = 0
    @word_count = 0
  end

  def add_score(score)
    @score += score
  end

  def add_word(word)
    @word_count += 1
    @score += @game.score(word)
  end
end
