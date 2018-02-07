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

  def test_it_can_score_words_with_multiple_letters
    assert_equal 8, Scrabble.new.score("hello")
    assert_equal 10, Scrabble.new.score("very")
  end

  def test_it_can_score_nil_and_empty
    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score()
  end

  def test_it_can_score_letter_multipliers
    assert_equal 9, Scrabble.new.score_with_multipliers("hello", [1,2,1,1,1])
    assert_equal 14, Scrabble.new.score_with_multipliers("very", [2,1,1,1])
  end

  def test_it_can_score_letter_and_word_multipliers
    assert_equal 18, Scrabble.new.score_with_multipliers("hello", [1,2,1,1,1], 2)
    assert_equal 42, Scrabble.new.score_with_multipliers("very", [2,1,1,1], 3)
  end
end
