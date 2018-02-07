gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup
    @game = Scrabble.new
  end

  def test_empty_score
    assert_equal 0, @game.score(nil)
    assert_equal 0, @game.score("")
  end

  def test_score_multiple_letter_words
    assert_equal 6, @game.score("bear")
    assert_equal 19, @game.score("quality")
  end

  def test_score_with_multipliers
    assert_equal 9, @game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, @game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_empty_score_multipliers
    assert_equal 0, @game.score_with_multipliers(nil, [])
    assert_equal 0, @game.score_with_multipliers("", [])
  end

  def test_invalid_word_score
    assert_equal 0, @game.score('helloo')
  end

  def test_invalid_word_score_multiplier
    assert_equal 0, @game.score_with_multipliers('helloo', [1,1,1,2,1,1])
  end
end
