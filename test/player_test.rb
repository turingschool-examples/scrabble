require_relative '../lib/player'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test
  def setup
    @player_1 = Player.new(:player_1)
  end

  def test_player_has_name
    assert_equal :player_1, @player_1.name
  end

  def test_player_has_a_number
    assert_equal 1, @player_1.number
  end


end
