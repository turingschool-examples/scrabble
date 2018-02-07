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

  def test_it_can_score_a_word_and_empty_args
    game = Scrabble.new
    assert_equal 8, game.score("hello")
    assert_equal 0, game.score("")
    assert_equal 0, game.score(nil)
  end

  def test_score_with_multipliers_method
    game = Scrabble.new

    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 'Invalid move', game.score_with_multipliers('hell', [1,2,1,1,1])
    assert_equal 'Invalid move', game.score_with_multipliers('hello', [1,2,1,1])
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_highest_scoring_word_method
    game = Scrabble.new

    assert_equal 'home', game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal 'word', game.highest_scoring_word(['hello', 'word', 'sound'])
    assert_equal 'silence', game.highest_scoring_word(['home', 'word', 'silence'])
    assert_equal 'word', game.highest_scoring_word(['hi', 'word', 'ward'])
  end
end
