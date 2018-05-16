gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exists
    game = Scrabble.new
    assert_instance_of Scrabble, game
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_multiletter_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
    assert_equal 14, game.score("john")
  end

  def test_it_can_score_zero
    game = Scrabble.new
    assert_equal 0, game.score("")
  end

  def it_can_score_nil
    game = Scrabble.new
    assert_equal nil, game.score(nil)
  end
  def test_score_with_multipliers
    game = Scrabble.new
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_score_with_multipliers_without_multiplier
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end
  
end
