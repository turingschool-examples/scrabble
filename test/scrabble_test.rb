gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_scrabble_object_exists
    game = Scrabble.new

    assert_instance_of Scrabble, game

  end

  def test_it_can_score_a_single_letter
    game = Scrabble.new

    assert_equal 1, Scrabble.new.value("a")
    assert_equal 4, Scrabble.new.value("f")
  end

  def test_it_can_score_a_word
    game = Scrabble.new

    assert_equal 8, game.score("hello")
    assert_equal 0, game.score("")
    assert_equal 0, game.score(nil)
  end

  # def test_score_with_letter_multiplier
  #   game = Scrabble.new
  #
  #   assert_equal 9, ("hello", [1,2,1,1,1])


end
