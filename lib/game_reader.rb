class GameReader
  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def word_count(player)
    player_number = player.number
    count = 0
    File.open(@filename).each do |line|
      if line[0].to_i == player_number
        count += 1
      end
    end
    count
  end

end
