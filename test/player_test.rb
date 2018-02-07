gem 'minitest'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test
  def test_player_has_id
    player = Player.new 1
    assert_equal 1, player.id
  end

  def test_player_can_take_score
    player = Player.new 1
    player.add_score 10
    assert_equal 10, player.score
    player.add_score 3
    assert_equal 13, player.score
  end
end
