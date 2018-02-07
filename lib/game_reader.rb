require_relative 'scrabble'
require_relative 'player'

class GameReader

  def initialize(filename)
    @instructions = File.read(filename).upcase.split("\n")
    @game = Scrabble.new
    play
  end

  def play
    @instructions.delete_at(0)
  end

  def word_count

  end

  def score

  end
end
