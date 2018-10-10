require_relative '../lib/game_reader'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class GameReaderTest < Minitest::Test
  def setup
    @game = GameReader.new('./test/input.csv')
    @player_1 = Player.new(:player_1)
    @player_2 = Player.new(:player_2)
  end


  def test_it_exists
    assert_instance_of GameReader, @game
  end

  def test_it_can_count_player_words
    assert_equal 3, @game.word_count(:player_1)
  end

  def test_it_can_count_another_player_words
    assert_equal 2, @game.word_count(:player_2)
  end

  def test_it_can_get_player_words
    assert_equal ["hello", "silence", "fun"], @game.get_player_words(:player_1)
  end

  def test_it_can_score_player_words
    assert_equal 23, @game.score(:player_1)
  end


end
