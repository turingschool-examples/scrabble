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
    split_array = read_file
    find_words(player, split_array).length
  end

  def find_words(player, split_array)
    split_array.find_all do |array|
      array[0] = player[-1]
    end
  end
end
