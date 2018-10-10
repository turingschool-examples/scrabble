require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test
  def setup
    @game = GameReader.new('./test/input.csv')
  end

  def test_it_exists
    assert_instance_of GameReader, @game
  end

  def test_it_can_parse_csv
    parsed_obj = @game.parse_csv
    expected = {}
    
    assert_equal expected, parsed_obj
  end
end
