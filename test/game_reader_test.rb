gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test
  def test_takes_input_file
    game = GameReader.new('./test/input.csv')

    assert_instance_of GameReader, game
  end

  def test_read_file
    game = GameReader.new('./test/input.csv')

    assert_equal 6, game.read_file.length
    assert_equal ['1', 'hello'], game.read_file[1]
  end

  def test_word_count
    game = GameReader.new('./test/input.csv')

    assert_equal 3, game.word_count(:player_1)
    assert_equal 2, game.word_count(:player_2)
  end
end
