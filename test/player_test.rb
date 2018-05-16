gem 'minitest'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test
  def test_it_exists
    player_1 = Player.new("player_1")
    assert_instance_of Player, player_1
    assert_equal [], player_1.word_list
    assert_equal 0, player_1.score
  end
end
