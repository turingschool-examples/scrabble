gem 'minitest'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test

  def test_player_can_exist
    player = Player.new
    assert_instance_of Player, player
  end
end
