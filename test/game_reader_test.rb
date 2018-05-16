gem 'minitest'
require_relative '../lib/game_reader'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class GameReaderTest < Minitest::Test

  def test_game_can_exist
    game = GameReader.new
    assert_instance_of GameReader, game
  end

  def test_words_can_be_scored

  end

  def test__word_count__can_update

  end


end
