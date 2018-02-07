gem 'minitest'
require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test

  def player
    @player
  end

  def setup
    @player = Player.new(%w[a b c d e f g])
  end

  def test_player_initializes_with_seven_tiles
    assert_instance_of Player, player
    assert_equal 7, player.tiles.length
  end

end
