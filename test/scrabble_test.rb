require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup
    @game = Scrabble.new
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, @game.score('a')
    assert_equal 4, @game.score('f')
  end

  def test_it_can_score_actual_words
    assert_equal 5, @game.score('anten')
    assert_equal 15, @game.score('skrabec')
    assert_equal 8, @game.score('hello')
  end

  def test_capitalization_doesnt_matter
    assert_equal @game.score('anten'), @game.score('anten'.upcase)
  end

  def test_score_returns_zero_when_nil
    assert_equal 0, @game.score(nil)
  end

  def test_score_returns_zero_when_empty
    assert_equal 0, @game.score('')
  end

  def test_score_with_multipliers_default
    assert_equal 10, @game.score_with_multipliers('hello', [1, 2, 1, 1, 2])
  end

  def test_score_with_multiplier
    assert_equal 18, @game.score_with_multipliers('hello', [1, 2, 1, 1, 1], 2)
    assert_equal 27, @game.score_with_multipliers('hello', [1, 2, 1, 1, 1], 3)
  end
end
