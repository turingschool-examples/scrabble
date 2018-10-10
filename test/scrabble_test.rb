require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word

    assert_equal 8, Scrabble.new.score("hello")
  end

  def test_it_can_score_an_empty_string

    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_can_score_nil

    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_pass_multipliers
    game = Scrabble.new

    assert_equal 9, game.multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_score_different_multipliers
    game = Scrabble.new
    assert_equal 18, game.multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_seven_letter_bonus
    game = Scrabble.new
    assert_equal 58, game.multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  # def test_highest_scoring_word
  # end




end
