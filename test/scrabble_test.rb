require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_operation_is_functional
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

  def test_it_does_not_score_blanks
    game = Scrabble.new
    assert_equal 0, game.score("")
    assert_equal 0, game.score(nil)
  end

  def test_multipliers_scores_appropriately
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_game_score_with_multipliers
    game = Scrabble.new
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_highest_scoring_word
    game = Scrabble.new
    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end
end
