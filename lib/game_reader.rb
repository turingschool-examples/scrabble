require 'CSV'
require_relative './scrabble'
require 'pry'

class GameReader
  attr_reader :scrabble

  def initialize(csv_path)
    @csv_path = csv_path
    @scrabble = Scrabble.new
    parse_csv
  end

  def parse_csv
    CSV.foreach(@csv_path) do |row|
      if row[0] != "player_id"
        player_sym = "player_#{row[0]}".to_sym
        @scrabble.add_play(player_sym, row[1])
      end
    end
  end

  def word_count(player_sym)
    @scrabble.record[player_sym].count
  end

end
