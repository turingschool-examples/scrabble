require 'CSV'
require_relative './scrabble'
require 'pry'

class GameReader
  def initialize(csv_path)
    @csv_path = csv_path
    @scrabble = Scrabble.new
  end

  def parse_csv
    record = {}
    CSV.foreach(@csv_path) do |row|
      if row[0] != "player_id"
        player_sym = "player_#{row[0]}".to_sym
        @scrabble.add_play(player_sym, row[1])
      end
    end
    binding.pry
  end
end
