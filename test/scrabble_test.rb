gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'

require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    skip
    scrabble = Scrabble.new

    assert_equal 1, scrabble.score("a", [])
    assert_equal 4, scrabble.score("f", [])
  end

  def test_it_can_score_a_word
    skip
    scrabble = Scrabble.new

    assert_equal 8, scrabble.score("hello", [])
    assert_equal 9, scrabble.score("world", [])
  end

  def test_it_can_score_an_empty_guess
    skip
    scrabble = Scrabble.new

    assert_equal 0, scrabble.score("", [])
  end

  # def test_it_can_score_a_nil
  #   scrabble = Scrabble.new
  #
  #   assert_equal 0, scrabble.score(nil)
  # end

  def test_it_can_score_with_multipliers
    scrabble = Scrabble.new

    assert_equal 9, scrabble.score_with_multipliers("hello", [1, 2, 1, 1, 1])
    assert_equal 9, scrabble.score_with_multipliers("world", [1, 2, 1, 1, 1])
  end
end
