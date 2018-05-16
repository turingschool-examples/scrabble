gem 'minitest'
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

    assert_equal 1, game.score_single_letter("a")
    assert_equal 4, game.score_single_letter("f")
  end

  def test_it_can_score_word
    game = Scrabble.new

    assert_equal 6, game.score("you")
    assert_equal 7, game.score("here")
    assert_equal 0, game.score("")
    assert_equal 0, game.score(nil)
  end

  # > game.score_with_multipliers('hello', [1,2,1,1,1])
  # => 9
  # > game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  # => 18

end
