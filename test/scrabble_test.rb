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
    assert_equal 0, @scrabble.score("")
    assert_equal 0, @scrabble.score(nil)
  end

  def test_it_can_score_words
    assert_equal 5, @scrabble.score("APE")
    assert_equal 12, @scrabble.score("zoo")
  end

  def test_it_can_take_multipliers
    assert_equal 6, @scrabble.score_with_multipliers("ape", [2, 1, 1])
    assert_equal 12, @scrabble.score_with_multipliers("ape", [2, 1, 1], 2)
  end

  def test_it_can_do_seven_letter_bonus
    assert_equal 23, @scrabble.score_with_multipliers("mountain", [1, 2, 3, 1, 1, 1, 1, 1])
    assert_equal 46, @scrabble.score_with_multipliers("mountain", [1, 2, 3, 1, 1, 1, 1, 1], 2)
  end

  def test_it_can_find_highest_scoring_word
    assert_equal "home", @scrabble.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal "word", @scrabble.highest_scoring_word(['hello', 'word', 'sound'])
  end
end
