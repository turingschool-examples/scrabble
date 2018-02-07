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

  def test_scoring_two_words

    assert_equal 6, Scrabble.new.score("bc")
    assert_equal 5, Scrabble.new.score("sw")
  end

  def test_scoring_words

    assert_equal 8, Scrabble.new.score("hello")
    assert_equal 10, Scrabble.new.score("what")
  end

  def test_scoring_empty_strings

      assert_equal 0, Scrabble.new.score("")
    end

    def test_scoring_nil

      assert_equal 0, Scrabble.new.score(nil)
    end

    def test_score_multiplying_two_letters
      game = Scrabble.new

      assert_equal 3, game.score_with_multipliers('ae', [1,2])
      assert_equal 7, game.score_with_multipliers('ef', [3,1])
    end

    def test_score_multiplyng_full_word
      game = Scrabble.new

      assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
      assert_equal 14, game.score_with_multipliers('world', [1,2,1,1,3])
    end

    def test_bonus_doublers
      game = Scrabble.new

      assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
      assert_equal 42, game.score_with_multipliers('world', [1,2,1,1,3], 3)
    end

    def test_seven_plus_letter_word_bonus
      game = Scrabble.new

      assert_equal 58, game.score_with_multipliers("sparkle", [1,2,1,3,1,2,1], 2)
    end
end
