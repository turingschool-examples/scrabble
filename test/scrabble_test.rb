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

  def test_it_can_score_a_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
  end

  def test_it_can_score_an_empty_string
    game = Scrabble.new
    assert_equal 0, game.score("")
  end

  def test_it_can_score_nil
    game = Scrabble.new
    assert_equal 0, game.score(nil)
  end

  def test_it_can_score_with_letter_multipliers
    game = Scrabble.new
    actual = game.score_with_multipliers('hello', [1,2,1,1,1])
    expected = 9
    assert_equal expected, actual
  end

  def test_it_can_score_with_letter_and_word_multipliers
    game = Scrabble.new
    actual = game.score_with_multipliers('hello', [1,2,1,1,1], 2)
    expected = 18
    assert_equal expected, actual
  end

  def test_it_adds_seven_letter_bonus
    game = Scrabble.new
    actual = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    expected = 58
    assert_equal expected, actual
  end

end
