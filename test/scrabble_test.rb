require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup
    @scrabble = Scrabble.new
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, @scrabble.score("a")
    assert_equal 4, @scrabble.score("f")
  end

  def test_it_can_score_an_empty_string
    assert_equal 0, @scrabble.score("")
  end

  def test_it_can_score_nil
    assert_equal 0, @scrabble.score(nil)
  end

  def test_it_returns_the_string_if_numeric_is_passed_to_score
    assert_equal "Invalid Input", @scrabble.score(8)
    assert_equal "Invalid Input", @scrabble.score(8.0)
  end

  def test_it_can_score_a_word_with_no_multipliers
    assert_equal 8, @scrabble.score("hello")
  end

  def test_it_can_score_a_word_with_letter_multipliers_only
    assert_equal 9, @scrabble.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_score_a_word_with_letter_and_word_multipliers
    assert_equal 18, @scrabble.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_can_score_a_word_with_all_multipliers
    assert_equal 58, @scrabble.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end
end
