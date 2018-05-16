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
    game = Scrabble.new

    assert_equal 1, game.score_single_letter("a")
    assert_equal 4, game.score_single_letter("f")
  end

  def test_it_can_score_word
    game = Scrabble.new

    assert_equal 6, game.score("you")
    assert_equal 7, game.score("here")
    assert_equal 0, game.score("")
    assert_equal 0, game.score(nil)
  end

  def test_it_can_score_letter_with_multiplier
    game = Scrabble.new

    assert_equal 16, game.score_letter_with_multiplier("j", 2)
    assert_equal 8, game.score_letter_with_multiplier("v", 2)
  end

  def test_it_can_score_word_with_multipliers
    game = Scrabble.new

    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  # > game.score_with_multipliers('hello', [1,2,1,1,1])
  # => 9
  # > game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  # => 18

end
