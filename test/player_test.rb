gem 'minitest'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test
  def test_player_exists
    player_1 = Player.new

    assert_instance_of Player, player_1
  end
end
