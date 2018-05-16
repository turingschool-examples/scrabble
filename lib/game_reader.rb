require './lib/scrabble.rb'

class GameReader

  attr_accessor :player_1, :player_2, :word_count, :score

  def initialize(file)
    @player_1 = {@word_count => 0, @score => 0}
    @player_2 = {@word_count => 0, @score => 0}
    @score = 0
    @word_count = 0
    @file_info = read_file(file)
  end

  def read_file(file)
    file_array = File.readlines(file)
    file_array.map! do |line|
      line.strip
    end
    file_array.map! do |line|
      line.split(',')
    end
    parse_info(file_array)
  end

  def parse_info(file_array)
    s = Scrabble.new
    file_array.shift
    file_array.each do |line|
      if line[0] == '1'
        @player_1['word_count'] += 1
        @player_1['score'] += s.score_with_multipliers(line[1])
      else
        @player_2['word_count'] += 1
        @player_2['score'] += s.score_with_multipliers(line[1])
      end
    end
  end

  def word_count(player)
    if player = 'player_1'
      return @player_1[word_count]
    else
      return @player_2[word_count]
    end
  end

  def score(player)
    if player = 'player_1'
      return @player_1[score]
    else
      return @player_2[score]
    end
  end

end
