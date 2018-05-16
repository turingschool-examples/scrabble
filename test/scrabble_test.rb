gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    game = Scrabble.new
    assert_equal 1, game.score("a")
    assert_equal 4, game.score("f")
  end

  def test_it_can_format_a_word
    game = Scrabble.new
    assert_equal ["H","E","L","L","O"], game.format_word("hello")
  end

  def test_it_can_score_a_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
    assert_equal 16, game.score("Chocolate")
  end

  def test_it_can_score_an_empty_string
    game = Scrabble.new
    assert_equal 0, game.score("")
  end

  def test_it_can_score_nil
    game = Scrabble.new
    assert_equal 0, game.score(nil)
  end

  def test_it_can_multiply_a_single_letter
    game = Scrabble.new
    assert_equal 2, game.score_with_multipliers('a', [2])
  end

  def test_it_can_score_multipliers_single_letter
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_score_with_multipliers_single_word
    skip
    game = Scrabble.new
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end
end
