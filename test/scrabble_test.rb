gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exists
    game = Scrabble.new("a", 1)
    assert_instance_of Scrabble, game
  end

  def test_it_can_score_a_single_letter
    game = Scrabble.new("a", 1)
    assert_equal 1, game.score("a", 1)
    game_1 = Scrabble.new("f", 4)
    assert_equal 4, game.score("f", 4)
    game_2 = Scrabble.new("", 0)
    assert_equal 0, game.score("" ,0)
    game_3 = Scrabble.new("*", nil)
    assert_equal nil, game.score("*", nil)
  end

  def test_it_can_score_with_multipliers
    game = Scrabble.new("a", 1)
    game_1 = Scrabble.new('hello', "[1,2,1,1,1]")
    assert_equal [], game.it_can_score_with_multipliers('hello', "[1,2,1,1,1]")
  end
end
