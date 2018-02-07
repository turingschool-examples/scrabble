gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    game = Scrabble.new

    assert_equal 1, game.score('a')
    assert_equal 4, game.score('f')
  end

  def test_it_can_score_two_letters
    game = Scrabble.new

    assert_equal 4, game.score('am')
  end

  def test_it_can_score_5_letters
    game = Scrabble.new

    assert_equal 15, game.score('happy')
  end

  def test_it_can_score_an_empty_string
    game = Scrabble.new

    assert_equal 0, game.score('')
  end

  def test_it_can_score_when_someone_passes_nil
    game = Scrabble.new

    assert_equal 0, game.score(nil)
  end

  def test_score_with_multipliers_actually_multiplies
    game = Scrabble.new

    expected = 9
    actual = game.score_with_multipliers('hello', [1,2,1,1,1])

    assert_equal expected, actual
  end

  def test_score_with_letter_multiplier_and_word_multiplier
    game = Scrabble.new

    expected = 18
    actual = game.score_with_multipliers('hello', [1,2,1,1,1], 2)

    assert_equal expected, actual
  end

  def test_ten_point_bonus_for_seven_letter_words
    game = Scrabble.new

    expected = 58
    actual = game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)

    assert_equal expected, actual
  end

  def highest_scoring_word_method
    game = Scrabble.new

    expected = 'home'
    actual = game.highest_scoring_word(['home', 'word', 'hello', 'sound'])

    assert_equal expected, actual
  end

  def highest_scoring_word_takes_words_with_fewer_tiles
    game = Scrabble.new

    expected = 'word'
    actual = game.highest_scoring_word(['hello', 'word', 'sound'])

    assert_equal expected, actual
  end
end
