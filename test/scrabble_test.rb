gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup
    @scrabble = Scrabble.new
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, @scrabble.score_one_letter("a")
    assert_equal 4, @scrabble.score_one_letter("f")
  end

  def test_it_can_score_multiple_letters
    assert_equal 4, @scrabble.score("ab")
    assert_equal 8, @scrabble.score("abba")
  end

  def test_scrabble_does_not_count_non_letters
    assert_equal 0, @scrabble.score("")
    assert_equal 0, @scrabble.score(nil)
  end

  def test_scrabble_returns_array_of_letter_values
    scrabbled = @scrabble.word_to_array("abba")
    assert_equal [1, 3, 3, 1], scrabbled
  end

  def test_scrabble_multiplies_one_letter
    assert_equal 2, @scrabble.score_with_multipliers("e", [2])
    assert_equal 16, @scrabble.score_with_multipliers("j", [2])
  end

  def test_scrabble_scores_with_letter_multipliers
    assert_equal 9, @scrabble.score_with_multipliers("hello", [1, 2, 1, 1, 1])
    assert_equal 26, @scrabble.score_with_multipliers("bye", [3, 4, 1])
  end

  def test_scrabble_scores_with_word_multipliers
    assert_equal 18, @scrabble.score_with_multipliers("hello", [1,2,1,1,1], 2)
  end

  def test_scrabble_scores_with_letter_length_bonus
    actual = @scrabble.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    assert_equal 48, actual
    expected = @scrabble.score_with_multipliers('eeeeeee', [1,1,1,1,1,1,1], 1)
    assert_equal 17, expected
  end

  def test_makes_word_into_hash
    @scrabble.word_to_hash("cheese")
    actual = @scrabble.word_hash
    assert_equal({"cheese" => 11}, actual)
  end

  def test_word_hash_can_contain_multiple_words
    @scrabble.word_to_hash("cheese")
    @scrabble.word_to_hash("me")
    actual = @scrabble.word_hash
    assert_equal({"cheese" => 11, "me" => 4}, actual)
  end

  def test_scrabble_finds_highest_scoring_word
    actual = @scrabble.highest_scoring_word(["cheese", "me"])
    assert_equal "cheese", actual
  end


end
