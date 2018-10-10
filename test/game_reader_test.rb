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
end
