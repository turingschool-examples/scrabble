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
    assert_equal 1, game.score("a")
  end

  def test_it_can_score_a_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
  end

  def test_case_name
    game = Scrabble.new
    assert_equal 0, game.score("")
    assert_equal 0, game.score(nil)
  end

  def test_it_has_multipliers
    game = Scrabble.new
    actual = game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 9, actual
  end

  def test_it_has_multipliers_with_double_word
    game = Scrabble.new
    actual = game.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 18, actual
  end

  def test_multipliers_adds_another_set_of_points
    game = Scrabble.new
    actual = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    assert_equal 58, actual
  end

  def test_highest_scoring_word
    game = Scrabble.new
    actual = game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal "home", actual
  end
end
