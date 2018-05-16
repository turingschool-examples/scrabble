class Player
attr_reader :player_id, :word_list, :score

  def initialize(player_id)
    @player_id = player_id
    @word_list = []
    @score = 0
  end
end
