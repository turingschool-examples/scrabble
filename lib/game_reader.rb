require 'csv'

class GameReader
  def initialize(file)
    all_lines = CSV.read(file)
    all_lines.shift
    @words_by_player = all_lines
    # all_lines.each do |line|
    #   @words_by_player << line.split(",")
    # end
  end

  def word_count(player)
    words = { player_1: 0, player_2: 0 }
    @words_by_player.each do |line|
      if line[0] == "1"
        words[:player_1] += 1
      else
        words[:player_2] += 1
      end
    end
    words[player]
  end
end


# player_id,word
# 1,hello
# 2,hi
# 1,silence
# 2,snacker
# 1,fun
