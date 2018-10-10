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

  def test_it_can_count_player_words
    assert_equal 3, @game.word_count(:player_1)
  end



end
