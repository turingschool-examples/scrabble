gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score('a')
    assert_equal 4, Scrabble.new.score('f')
  end

  def test_it_can_score_a_word
    assert_equal 10, Scrabble.new.score('alpha')
    assert_equal 10, Scrabble.new.score('forget')
  end

  def test_it_can_score_an_empty_string
    assert_equal 0, Scrabble.new.score('')
  end

  def test_it_can_score_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_a_letter_with_a_letter_multiplier
    assert_equal 8, Scrabble.new.score_with_multipliers('w', [2], 1)
    assert_equal 16, Scrabble.new.score_with_multipliers('x', [2], 1)
  end

  def test_it_can_score_a_word_with_letter_multipliers
    assert_equal 10, Scrabble.new.score_with_multipliers('word', [1,2,2,1], 1)
    assert_equal 43, Scrabble.new.score_with_multipliers('giraffe', [1,2,2,1,3,3,2], 1)
  end

  def test_it_can_score_a_word_with_word_multiplier
    assert_equal 20, Scrabble.new.score_with_multipliers('word', [1,2,2,1], 2)
    assert_equal 129, Scrabble.new.score_with_multipliers('giraffe', [1,2,2,1,3,3,2], 3)
  end

  def test_it_can_add_7_letter_bonus
    assert_equal 129, Scrabble.new.score_with_multipliers('giraffe', [1,2,2,1,3,3,2], 3)
    assert_equal 52, Scrabble.new.score_with_multipliers('students', [1,2,2,1,3,3,2,1], 2)
  end
end
