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

  def test_it_can_score_a_whole_word
    scrabble = Scrabble.new

    assert_equal 8, scrabble.score("hello")
  end

  def test_score_with_multipliers
    scrabble = Scrabble.new

    assert_equal 9, scrabble.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, scrabble.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_ten_point_bonus
    scrabble = Scrabble.new

    assert_equal 58, scrabble.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_highest_scoring_word
    game = Scrabble.new

    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal "word", game.highest_scoring_word(['hello', 'word', 'sound'])
    assert_equal "silence", game.highest_scoring_word(['home', 'word', 'silence'])
    assert_equal "word", game.highest_scoring_word(['hi', 'word', 'ward'])
  end
end
