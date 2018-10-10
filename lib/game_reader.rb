require './lib/scrabble'

class GameReader
  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def word_count(player_name)
    player = Player.new(player_name)
    player_number = player.number
    count = 0
    File.open(@filename).each do |line|
      if line[0].to_i == player_number
        count += 1
      end
    end
    count
  end

  def score(player_name)
    words = get_player_words(player_name)
    score = 0
    words.each do
      
    end
  end

  def get_player_words(player_name)
    player = Player.new(player_name)
    player_number = player.number

    words = File.open(@filename).map do |line|
      if line[0].to_i == player_number
        line[2..-1].chomp
      end
    end
    words.compact!
  end

end
