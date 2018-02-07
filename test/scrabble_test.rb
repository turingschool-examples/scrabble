gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  attr_reader :game
  def setup
    @game = Scrabble.new
  end

  def test_initializes
    assert_instance_of Scrabble, game
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, game.score('a')
    assert_equal 4, game.score('f')
  end

  def test_scoring_works_with_empty_string
    assert_equal 0, game.score('')
  end

  def test_score_works_with_nil
    assert_equal 0, game.score(nil)
  end

  def test_score_works_for_full_word
    assert_equal 7, game.score('Adam')
    assert_equal 14, game.score('miCHael')
    assert_equal 18, game.score('TuringSchool')
  end

  def test_letter_multipliers
    assert_equal 9, game.score_with_multipliers('Adam', [1, 2, 1, 1])
    assert_equal 32, game.score_with_multipliers('Happy', [1, 2, 1, 1, 5])
    assert_equal 9, game.score_with_multipliers('Dog', [1, 5, 1])
  end

  def test_word_multipler
    assert_equal 18, game.score_with_multipliers('Adam', [1, 2, 1, 1], 2)
    assert_equal 96, game.score_with_multipliers('Happy', [1, 2, 1, 1, 5], 3)
    assert_equal 45, game.score_with_multipliers('Dog', [1, 5, 1], 5)
  end

  def test_bonus_for_7_or_more
    assert_equal 78, game.score_with_multipliers('miCHael', [1,2,1,1,2,1,1], 3)
    assert_equal 170, game.score_with_multipliers('TuringSchool', [1,2,1,1,2,1,1,2,1,1,2,1], 5)
  end
end
