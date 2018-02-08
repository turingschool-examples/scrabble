gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'rake'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")

  end

  def test_it_can_score_a_word

    assert_equal 8, Scrabble.new.score("hello")
  end

  def test_it_can_score_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_with_letter_multipilers

    result = Scrabble.new.score_with_multipliers("hello", [1,3,1,1,1])
    assert_equal 10, result
  end

  def test_it_can_score_with_word_multipilers

    result = Scrabble.new.score_with_multipliers("hello", [1,3,1,1,1], 2)
    assert_equal 20, result
  end

  def test_it_can_score_a_seven_letter_bonus

    result = Scrabble.new.score("morning")
    assert_equal 60, result
  end

  def test_it_can_score_a_seven_letter_bonus_with_multipliers
    result = Scrabble.new.score_with_multipliers("morning", [1,1,1,1,1,1,1])
    assert_equal 60, result
  end
end
