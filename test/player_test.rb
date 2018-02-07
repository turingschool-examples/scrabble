gem 'minitest'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test
  def test_player_initialized
    player = Player.new 1
    assert_equal 1, player.id
    assert_equal 0, player.score
    assert_equal [], player.words
  end

  def test_player_can_take_score
    player = Player.new 1
    player.add_score 10
    assert_equal 10, player.score
    player.add_score 3
    assert_equal 13, player.score
  end

  def test_player_can_take_words
    player = Player.new 1
    player.add_word "word"
    assert_equal 1, player.words.length
    assert_equal "word", player.words.first
    player.add_word "foo"
    assert_equal 2, player.words.length
    assert_equal "foo", player.words.last
  end
end
