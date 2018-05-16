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

  def test_score_a_word_with_letter_multipliers
    game = Scrabble.new

    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_score_word_with_a_word_multiplier
    game = Scrabble.new

    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end


  def test_it_can_score_a_word_with_a_seven_letter_bonus
    game = Scrabble.new

    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_highest_score_word
    skip
    game = Scrabble.new

    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end
end
