gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exists
    scrabble = Scrabble.new
    assert_instance_of Scrabble, scrabble
  end


  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    assert_equal 8, Scrabble.new.score("hello")
    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_multiplies_letters
    actual = Scrabble.new.score_with_multipliers("hello", [1,2,1,1,1])

    assert_equal 9, actual
  end

  def test_it_multiplies_word
    actual = Scrabble.new.score_with_multipliers("hello", [1,2,1,1,1], 2)

    assert_equal 18, actual
  end

  def test_it_adds_ten_if_seven_or_more_letters
    game = Scrabble.new
    actual = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)

    assert_equal 58, actual
  end

  def test_it_returns_highest_scoring_word
    game = Scrabble.new
    expected = "home"
    actual = game.highest_scoring_word(['home', 'word', 'hello', 'sound'])

    assert_equal expected, actual
  end

  def test_picks_one_with_fewest_letters
    game = Scrabble.new
    expected = 'word'
    actual = game.highest_scoring_word(['hello', 'word', 'sound'])

    assert_equal expected, actual
  end
end
