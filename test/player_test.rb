gem 'minitest'
require_relative '../lib/player'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class PlayerTest < Minitest::Test
  def setup
    @player_1 = Player.new(Scrabble.new)
  end

  def test_total_score_starts_at_0
    assert_equal 0, @player_1.total_score
  end

  def test_total_score_increases
    @player_1.play('bear')

    assert_equal 6, @player_1.total_score

    @player_1.play('quality')

    assert_equal 25, @player_1.total_score

    @player_1.play('heloooo')

    assert_equal 25, @player_1.total_score
  end

  def test_turns_starts_at_0
    assert_equal 0, @player_1.turns
  end

  def test_turns_increase_when_playing
    @player_1.play('bear')
    @player_1.play('quality')
    @player_1.play('heloooo')

    assert_equal 3, @player_1.turns
  end
end
