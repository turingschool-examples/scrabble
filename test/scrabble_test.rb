gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  # def test_it_can_score_a_single_letter
  #   assert_equal 1, Scrabble.new.score("a")
  #   assert_equal 4, Scrabble.new.score("f")
  # end
  #
  # def test_can_score_two_letters
  #   assert_equal 5, Scrabble.new.score("if")
  # end
  #
  # def test_it_can_score_a_word
  #   assert_equal 8, Scrabble.new.score("hello")
  # end
  #
  # def test_it_can_score_empty_string
  #   assert_equal 0, Scrabble.new.score("")
  # end
  #
  # def test_it_can_score_nil
  #   assert_equal 0, Scrabble.new.score(nil)
  # end
  #
  # def test_can_score_with_multipliers_two_args
  #   game = Scrabble.new
  #
  #   actual = game.score_with_multipliers('hello', [1,2,1,1,1])
  #   expected = 9
  #
  #   assert_equal expected, actual
  # end
  #
  # def test_can_score_with_multipliers_three_args
  #   game = Scrabble.new
  #
  #   actual = game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  #   expected = 18
  #
  #   assert_equal expected, actual
  # end

  def test_can_add_points_for_word_length
    game = Scrabble.new

    actual = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    expected = 58

    assert_equal expected, actual
  end



end
