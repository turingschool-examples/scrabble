gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup
    @game = Scrabble.new
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, @game.score("a")
    assert_equal 4, @game.score("f")
    assert_equal 0, @game.score("")
  end

  def test_it_can_score_a_word
    assert_equal 8, @game.score("hello")
  end

  def test_it_can_do_multipliers
    assert_equal 8,  @game.score("hello", [1,2,1,1,1])
    assert_equal 18, @game.score("hello", [1,2,1,1,1], 2)
  end
end
