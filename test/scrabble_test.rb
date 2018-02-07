gem 'minitest'
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
    assert_equal 0, @game.score('')
    assert_equal 0, @game.score(nil)
  end

  def test_it_can_score_a_wordr
    assert_equal 8, @game.score('hello')
  end

  def test_it_can_do_multipliers
    bonus10 = @game.score_with_multipliers('sparkle', [1, 2, 1, 3, 1, 2, 1], 2)

    assert_equal 9,  @game.score_with_multipliers('hello', [1, 2, 1, 1, 1])
    assert_equal 18, @game.score_with_multipliers('hello', [1, 2, 1, 1, 1], 2)
    assert_equal 58, bonus10
  end
end
