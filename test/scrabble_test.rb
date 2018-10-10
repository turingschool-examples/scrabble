require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
  end

  def test_no_word_returns_0_points
    game = Scrabble.new
    assert_equal 0, game.score("")
  end
end
