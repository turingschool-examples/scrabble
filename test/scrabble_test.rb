require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_it_exists
    assert_instance_of Scrabble, Scrabble.new
  end
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end
  def test_it_can_score_a_complete_word
    assert_equal 8, Scrabble.new.score("Hello")
  end
  def test_it_can_score_nil_word
    assert_equal 0, Scrabble.new.score(nil)
  end
  def test_it_can_score_empty_string
    assert_equal 0, Scrabble.new.score("")
  end
  def test_it_can_score_with_multipliers
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end
  def test_it_can_score_with_doubler
    game = Scrabble.new
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end
  def test_it_can_apply_7_letter_bonus
    game = Scrabble.new
    expected = 58
    actual = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    assert_equal actual, expected
  end
  def test_it_returns_highest_scorer_with_simple_rules
    game = Scrabble.new
    actual = game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal 'home', actual
  end

end
