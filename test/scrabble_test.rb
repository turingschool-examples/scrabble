gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_multi_letters
    assert_equal 8, Scrabble.new.score("hello")
  end 

  def test_it_returns_zero_for_nil_or_empty
    assert_equal 0, Scrabble.new.score(nil)
    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_can_score_multipliers
    board = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 9, board
  end 
end
