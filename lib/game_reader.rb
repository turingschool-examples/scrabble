require 'CSV'

class GameReader
  attr_reader :file

  def initialize
    @file = './test/input.csv'
  end

  def word_count(player)
    word_count = player.word_count
  end

  def score(player)
    total = 0
    CSV.foreach(file) do |row|
      puts "LOOK AT ME!"
      puts row.last
      # total += [:letter]
    end
  end

  def player_to_score
    CSV.foreach(file) do |row|
      if row.contains(1)
        "player_one"
      elsif row.contains(2)
        "player_two"
      end
    end
    file
  end



end
