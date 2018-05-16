require 'pry'
require 'csv'
require './lib/scrabble'

class GameReader
  def initialize(filename)
    @player_1 = Player.new
    @player_2 = Player.new
    read_csv(filename)
  end

  def read_csv(filename)
    raw_data = CSV.read(filename)
    raw_data.each do | line |
      player = nil
      if line[0] == "1"
        player = @player_1
      elsif line[0] == "2"
        player = @player_2
      end

      if player != nil
        scrabble = Scrabble.new
        player.word_count += 1
        player.score += scrabble.score(line[1])
      end
    end
  end

  def word_count(player_symbol)
    if player_symbol == :player_1
      return @player_1.word_count
    else
      return @player_2.word_count
    end
  end

  def score(player_symbol)
    if player_symbol == :player_1
      return @player_1.score
    else
      return @player_2.score
    end
  end



end
