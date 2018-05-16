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

  def test_it_can_score_a_word
    assert_equal 5, Scrabble.new.score("dog")
    assert_equal 8, Scrabble.new.score("hello")
  end

  def test_it_can_score_an_empty_string
    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_can_score_when_passed_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_a_word_with_letter_multipliers
    assert_equal 10, Scrabble.new.score_with_multipliers('dog', [2, 2, 2])
    assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_score_a_word_with_a_word_multiplier
    assert_equal 20, Scrabble.new.score_with_multipliers('dog', [2, 2, 2], 2)
    assert_equal 27, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 3)
    assert_equal 58, Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_it_can_score_a_word_with_a_seven_letter_bonus
    assert_equal 19, Scrabble.new.score_with_multipliers("triangle", [1, 1, 1, 1, 1, 1, 1, 1], 1)
    assert_equal 78, Scrabble.new.score_with_multipliers("baseball", [2, 1, 1, 1, 1, 1, 1, 2], 3)
  end

  def test_can_it_correctly_find_highest_word_score
    game = Scrabble.new
    assert_equal 'home', game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal 'word', game.highest_scoring_word(['hello', 'word', 'sound'])
    assert_equal 'silence', game.highest_scoring_word(['home', 'word', 'silence'])
    # assert_equal 'word', game.highest_scoring_word(['hi', 'word', 'ward'])
  end


end
