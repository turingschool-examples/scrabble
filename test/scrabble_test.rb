require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    game = Scrabble.new
    assert_equal 1, game.score("a")
    assert_equal 4, game.score("f")
  end

  def test_it_can_score_nothing
    game = Scrabble.new
    assert_equal 0, game.score("")
    assert_equal 0, game.score(nil)
  end

  def test_it_can_score_with_multipliers
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers("hello", [1,2,1,1,1])
  end
end
