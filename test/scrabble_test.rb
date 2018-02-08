gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_if_it_exists
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
  end

  def test_it_can_score_a_word_capitalized
    game = Scrabble.new

    assert_equal 8, game.score("Hello")
  end

  def test_it_can_score_a_word_camelcase
    game = Scrabble.new

    assert_equal 13, game.score("HiThere")
  end

  def test_it_can_score_no_or_nil_word
    game = Scrabble.new

    assert_equal 0, game.score(nil)
    assert_equal 0, game.score("")
  end

  def test_it_can_score_a_single_letter_with_letter_multiplier
    game = Scrabble.new
    result = game.score_with_multipliers("z", [2])

    assert_equal 20, result
    refute_equal 22, result
  end

  def test_it_can_score_a_single_letter_with_letter_and_word_multipliers
    game = Scrabble.new
    result = game.score_with_multipliers("z", [2], 1)

    assert_equal 20, result
    refute_equal 22, result
  end

  def test_it_can_score_a_single_word_with_letter_multiplier
    game = Scrabble.new
    result = game.score_with_multipliers("hello", [1,2,1,1,1])

    assert_equal 9, result
    refute_equal 12, result
  end

  def test_it_can_score_a_single_word_with_letter_and_word_multipliers
    game = Scrabble.new
    result = game.score_with_multipliers("hello", [1,2,1,1,1], 2)

    assert_equal 18, result
    refute_equal 9, result
  end

  def test_it_can_score_a_seven_letter_word
    game = Scrabble.new
    result = game.score_with_multipliers("sparkle", [1,2,1,3,1,2,1], 2)

    assert_equal 58, result
    refute_equal 9, result
  end

  def test_it_can_score_another_seven_letter_word
    game = Scrabble.new
    result = game.score_with_multipliers("achieve", [2,2,1,3,2,2,1], 3)

    assert_equal 108, result
    refute_equal 36, result
  end

  def test_it_finds_the_highest_scoring_word
    game = Scrabble.new

    assert_equal "home",
    game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_it_finds_the_highest_scoring_word_with_same_scores
    game = Scrabble.new

    assert_equal "word",
    game.highest_scoring_word(['hello', 'word', 'sound'])
  end

end
