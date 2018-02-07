gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_exist
    game = Scrabble.new

    assert_instance_of Scrabble, game
  end

  def test_it_can_score_a_word
    game = Scrabble.new
    result = game.score("hello")

    assert_equal 8, result
  end

  def test_empty_string
    game = Scrabble.new
    result = game.score("")

    assert_equal 0, result
  end

  def test_it_is_nil
    game = Scrabble.new
    result = game.score(nil)

    assert_equal 0, result
  end

  def test_it_has_multipliers
    game = Scrabble.new
     result = game.score_with_multipliers('hello', [1,2,1,1,1])

     assert_equal 9, result
  end

end
