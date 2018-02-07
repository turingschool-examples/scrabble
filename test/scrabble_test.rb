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

  def test_it_can_score_a_word
    assert_equal 10, Scrabble.new.score("alpha")
    assert_equal 10, Scrabble.new.score("forget")
  end

  def test_it_can_score_an_empty_string
    assert_nil Scrabble.new.score("")
  end

  def test_it_can_score_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_a_letter_with_a_multiplier
    assert_equal 8, Scrabble.new.score_with_multipliers('w', [2])
  end
end
