require './lib/scrabble'
require './lib/player'

class GameReader
attr_reader :file

  def initialize(file)
    @current_game = File.read(file).split("\n")
  end

  def word_count(player_id)
    player = Player.new(player_id)
    player.word_list.length
  end

  def score(player_id)
    player = Player.new(player_id)
    player.score
  end
end
