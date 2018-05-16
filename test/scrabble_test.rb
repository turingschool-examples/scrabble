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

    assert_equal 1, game.score("a")
    assert_equal 4, game.score("f")
  end

  def test_it_can_score_a_word
    game = Scrabble.new

    assert_equal 8, game.score("hello")
    assert_equal 11, game.score("school")
  end

  def test_it_will_score_nothing_as_zero
    game = Scrabble.new

    assert_equal 0, game.score("")
    assert_equal 0, game.score("nil")
  end

  def test_score_with_l_multipliers
    game = Scrabble.new
    x1 = game.score_with_multipliers('hello', [1,2,1,1,1])

    assert_equal 9, x1
  end

  def test_score_with_l_and_w_multipliers
    game = Scrabble.new
    x1 = game.score_with_multipliers('hello', [1,2,1,1,1], 2)

    assert_equal 18, x1
  end

  def test_score_with_l_and_w_multipliers_and_bonus
    game = Scrabble.new
    x1 = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)

    assert_equal 58, x1
  end

  def test_highest_scoring_word
    game = Scrabble.new
    x1 = game.highest_scoring_word(['home', 'word', 'hello', 'sound'])

    assert_equal "home", x1
  end

  def test_highest_scoring_word_minimize_tiles
    game = Scrabble.new
    x1 = game.highest_scoring_word(['hello', 'word', 'sound'])

    assert_equal "word", x1
  end

end
