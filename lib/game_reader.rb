class GameReader
attr_reader :file

  def initialize(file)
    @current_game = File.read(file).split("\n")
  end

  def word_count(player)
    player.word_list.length
  end

  def score(player)
    player.score
  end
end
