gem 'minitest'
require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_multiple_letters
    assert_equal 11, Scrabble.new.score("america")
    assert_equal 13, Scrabble.new.score("freedom")
  end

  def test_it_can_score_with_empty_string
    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_can_score_with_nil_passed_in
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_with_letter_multipliers
    assert_equal 9, Scrabble.new.score_with_multipliers("hello", [1,2,1,1,1], nil)
  end

  def test_it_can_score_with_word_multipliers
    assert_equal 19, Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end
end
