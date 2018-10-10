require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test
  def setup
    @game_reader = GameReader.new('./test/input.csv')
  end

  def test_game_reader_creation
    assert_instance_of GameReader @game_reader
  end

  def test_game_reader_parsing; end
end
