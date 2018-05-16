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
    assert_equal 8, Scrabble.new.score("hello")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_alternative_entries
    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_score_with_multipliers
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_score_with_multipliers_and_word_bonus
  assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_can_score_with_multipliers_word_bonus_letter_bonus
  assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,1,1], 2)
  end

  def test_it_can_find_highest_scoring_word
  end

  def test_can_count_words_by_player
    assert_equal 0, game.word_count()
  end
end
