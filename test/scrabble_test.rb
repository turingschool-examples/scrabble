require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_handle_words
    assert_equal 4, Scrabble.new.score("Test")
    assert_equal 10, Scrabble.new.score("WANTED")
  end

  def test_if_it_can_handle_multipliers
    red = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
    long = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 9, red
    assert_equal 18, long
  end




end
