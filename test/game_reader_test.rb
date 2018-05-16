gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test

  def test_it_exists
    skip
    game = GameReader.new('./test/input.csv')
    assert_instance_of GameReader, game
  end

  def test_it_can_return_correct_word_counts
    skip
    game = GameReader.new('./test/input.csv')
    player_1 = 'player_1'
    player_2 = 'player_2'
    assert_equal 3, game.word_count(player_1)
    assert_equal 2, game.word_count(player_2)
  end

  def test_it_can_return_correct_scores
    skip
    game = GameReader.new('./test/input.csv')
    player_1 = 'player_1'
    player_2 = 'player_2'
    assert_equal 23, game.score(player_1)
    assert_equal 18, game.score(player_2)
  end

end
