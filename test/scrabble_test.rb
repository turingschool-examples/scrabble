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
    assert_equal 8, Scrabble.new.score('hello')
  end

  def test_if_empty_score_is_zero
    assert_equal 0, Scrabble.new.score('')
  end

  def test_if_nil_score_is_zero
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_scores_words_with_letter_multipliers
    assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_scores_words_with_letter_and_word_multipliers
    assert_equal 18, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_seven_letter_bonues_adds_ten_points
    assert_equal 58, Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_it_can_find_the_highest_scoring_word
    game = Scrabble.new
    assert_equal 'home', game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_it_can_return_shortest_high_scoring_word
    skip
    game = Scrabble.new
    assert_equal 'word', game.highest_scoring_word(['hello', 'word', 'sound'])
  end

end
