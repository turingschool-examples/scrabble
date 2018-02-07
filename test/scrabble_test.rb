gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def game
    @game
  end

  def setup
    @game = Scrabble.new
  end

  def test_it_can_score_a_single_letter
    # skip
    assert_equal 1, game.score("a")
    assert_equal 4, game.score("f")
  end

  def test_it_can_score_a_word
    assert_equal 8, game.score('hello')
    assert_equal 12, game.score('zoo')
  end

  def test_it_is_case_insensitive
    assert_equal 8, game.score('HelLo')
    assert_equal 12, game.score('zOo')
  end

  def test_it_scores_empty_strings
    assert_equal 0, game.score("")
  end

  def test_it_scores_nil
    assert_equal 0, game.score(nil)
  end

  def test_scores_with_multipliers
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_point_bonus_for_seven_or_more_letters
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end
end
