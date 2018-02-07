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

  def test_empty_score
    game = Scrabble.new
    assert_equal 0, game.score(nil)
    assert_equal 0, game.score("")
  end


  def test_score_multiple_letter_words
    assert_equal 7, Scrabble.new.score("abc")
    assert_equal 11, Scrabble.new.score("qi")
  end

  def test_score_with_multipliers
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_empty_score_multipliers
    game = Scrabble.new
    assert_equal 0, game.score_with_multipliers(nil, [])
    assert_equal 0, game.score_with_multipliers("", [])
  end
end
