gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test
  def test_game_reader_exists
    game_reader = GameReader.new('./test/input.csv')
    assert_instance_of GameReader, game_reader
  end

  def test_game_reader_returns_word_counts_and_scores_for_player_ids
    game_reader = GameReader.new('./test/input.csv')

    assert_equal 3, game_reader.word_count(:player_1)
    assert_equal 2, game_reader.word_count(:player_2)
    assert_equal 23, game_reader.score(:player_1)
    assert_equal 18, game_reader.score(:player_2)
  end
end
