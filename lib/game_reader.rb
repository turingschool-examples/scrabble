require_relative 'player'
require_relative 'scrabble'
require 'pry'

class GameReader
  attr_reader :player_1, :player_2, :tiles

  def initialize
    @tiles = {
      "A"=>9, "B"=>2, "C"=>2, "D"=>4,
      "E"=>12, "F"=>2, "G"=>3, "H"=>2,
      "I"=>9, "J"=>1, "K"=>1, "L"=>4,
      "M"=>2, "N"=>6, "O"=>8, "P"=>2,
      "Q"=>1, "R"=>6, "S"=>4, "T"=>6,
      "U"=>4, "V"=>2, "W"=>2, "X"=>1,
      "Y"=>2, "Z"=>1, ""=>2
    }
    @player_1 = Player.new(starting_tiles)
    @player_2 = Player.new(starting_tiles)
  end

  def get_letter
    return if @tiles.values.sum == 0
    available_tiles = @tiles.reject { |tile, count| count == 0 }
    letter = available_tiles.keys.sample
    @tiles[letter] -= 1
    letter
  end

  def starting_tiles
    tiles_array = []
    7.times { tiles_array << get_letter }
    tiles_array
  end

end
