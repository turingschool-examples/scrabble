require 'pry'
class GameReader
  def initialize(file)
    @file = file
  end

  def read_file
    file = File.readlines(@file)
    file.map do |line|
      line.chomp.split(',')
    end
  end

  def word_count(player)
  end
end
