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

  def test_it_can_score_two_letter_word
    assert_equal 2, Scrabble.new.score('at')
    assert_equal 11, Scrabble.new.score('za')
  end

  def test_it_can_score_empty_string_or_nil
    assert_equal 0, Scrabble.new.score('')
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_longer_word_score
    assert_equal 9, Scrabble.new.score('SwiM')
  end

  def test_score_with_multipliers
    game = Scrabble.new
    assert_equal 2, game.score_with_multipliers('a', [2])
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end
end
