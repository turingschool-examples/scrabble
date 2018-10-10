require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test
  def test_it_exists
    game = GameReader.new('./test/input.csv')
    assert_instance_of GameReader, game
  end
end
