require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test
  def setup
    @game = GameReader.new('./test/input.csv')
  end
  def test_it_can_create_game_readers
    assert_instance_of GameReader, @game
  end

  def test_it_can_count_words_per_person
    assert_equal 3, @game.word_count(:player_1)
    assert_equal 2, @game.word_count(:player_2)
  end

  def test_it_can_score_per_person
    # assert_equal 23, @game.score(:player_1) # doesn't take into account 7 letter bonus
    assert_equal 33, @game.score(:player_1)
    # assert_equal 18, @game.score(:player_2)
    assert_equal 28, @game.score(:player_2)  # doesn't take into account 7 letter bonus
  end
end
