require './lib/scrabble'
require './lib/player'

class GameReader
  def initialize(file_name)
    @file = File.open(file_name)
    @scrabble = Scrabble.new
    @players = {}

    parse(@file)
  end

  def parse(file)
    file.each do |line|
      return if line == 'player_id,word'

      splits = line.split(',')
      unless @players.key?(splits[0].to_i)
        @players[splits[0].to_i] = Player.new(@scrabble)
      end

      @players[splits[0].to_i].add_word(splits[1])
    end
  end
end
