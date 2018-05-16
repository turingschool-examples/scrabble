gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test

end

# player_id,word
# 1,hello
# 2,hi
# 1,silence
# 2,snacker
# 1,fun
# Write code that can parse that file and follow this interaction pattern:
#
# game = GameReader.new('./test/input.csv')
# game.word_count(:player_1)  # => 3
# game.word_count(:player_2)  # => 2
# game.score(:player_1)       # => 23
# game.score(:player_2)       # => 18
