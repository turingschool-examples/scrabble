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
    expected = {:player_1=>["hello", "silence", "fun"], :player_2=>["hi", "snacker"]}
    actual = @game.scrabble.record
    
    assert_equal expected , actual
  end

  def test_it_can_show_word_count_for_specified_player
    actual = @game.word_count(:player_1)

    assert_equal 3, actual
  end
end
