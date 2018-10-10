require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def setup
    @game = Scrabble.new
  end

  def test_it_exists
    assert_instance_of Scrabble, @game
  end

  def test_it_can_score_a_single_letter
     assert_equal 1, @game.score("a")
     assert_equal 4, @game.score("f")
  end

  def test_it_can_score_a_word
     assert_equal 8, @game.score("hello")
  end

  def test_it_returns_zero_for_a_space
     assert_equal 0, @game.score("")
  end

  def test_it_returns_zero_for_nil
     assert_equal 0, @game.score(nil)
  end
end
