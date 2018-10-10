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
    @game.parse_csv
    expected = {:player_1=>["hello", "silence", "fun"], :player_2=>["hi", "snacker"]}
    actual = @game.scrabble.record
    
    assert_equal expected , actual
  end
end
