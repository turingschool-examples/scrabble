gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    # skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_multiple_letters
    assert_equal 5, Scrabble.new.score("cat")
    assert_equal 6, Scrabble.new.score("dogs")
  end

  def test_it_can_score_an_empty_string
    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_can_score_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_seven_letter_words
    assert_equal 21, Scrabble.new.score("catdogs")
  end

  def test_it_can_score_with_letter_multipliers
    assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_can_score_seven_letter_word_with_multipliers
    assert_equal 58, Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_highest_scoring_word
    # game = Scrabble.new
    # game.highest_scoring_word(['home', 'word', 'hello', 'sound'])  # => "home"
    game = Scrabble.new
    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
    assert_equal "silence", game.highest_scoring_word(['home', 'word', 'silence'])
    assert_equal "word", game.highest_scoring_word(['hello', 'word', 'sound'])
    assert_equal "word", game.highest_scoring_word(['hi', 'word', 'ward'])
  end
end
