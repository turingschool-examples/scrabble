gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_if_it_exists
    game = Scrabble.new

    assert_instance_of Scrabble, game
  end

  def test_it_can_score_a_single_letter
    game = Scrabble.new

    assert_equal 1, game.score("a")
    assert_equal 4, game.score("f")
  end

  def test_it_can_score_a_word
    game = Scrabble.new

    assert_equal 8, game.score("hello")
  end

  def test_it_can_score_a_word_capitalized
    game = Scrabble.new

    assert_equal 8, game.score("Hello")
  end

  def test_it_can_score_a_word_camelcase
    game = Scrabble.new

    assert_equal 13, game.score("HiThere")
  end

  def test_it_can_score_no_or_nil_word
    game = Scrabble.new

    assert_equal 0, game.score(nil)
    assert_equal 0, game.score("")
  end

  def test_it_can_score_a_single_letter_with_letter_multiplier
    game = Scrabble.new
    result = game.score_with_multipliers("z", [2], 1)

    assert_equal 20, result
    refute_equal 22, result
  end

end
