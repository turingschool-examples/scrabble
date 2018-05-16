gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test
  def test_word_count
    game = GameReader.new('./test/input.csv')
    player_1 = Player.new(:player_1)
    player_2 = Player.new(:player_2)
    word_count = game.word_count(:player_1)
    assert_equal 3, word_count
    word_count = game.word_count(:player_2)
    assert_equal 2, word_count
    word_count = game.score(:player_1)
    assert_equal 23, word_count
    word_count = game.score(:player_2)
    assert_equal 18, word_count
  end
end
