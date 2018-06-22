gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    #skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_nil_or_empty_string_returns_0
    game = Scrabble.new
    assert_equal 0, game.score(nil)
    assert_equal 0, game.score('')
  end

  def test_score_with_multipliers_returns_score_for_word_multiplying_letters
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_score_with_multipliers_returns_zero_for_nil_or_empty_string
    game = Scrabble.new
    assert_equal 0, game.score_with_multipliers(nil, [])
    assert_equal 0, game.score_with_multipliers('', [3])
  end

  def test_score_with_multipliers_returns_score_for_word_multiplying_letters_with_word_multpilier
    game = Scrabble.new
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_score_with_multipliers_adds_10_point_bonus_before_word_multiplier_for_length_7_or_greater
    game = Scrabble.new
    assert_equal 58, game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    assert_equal 20, game.score_with_multipliers('aaaaaaaaaa', [1,1,1,1,1,1,1,1,1,1])
    assert_equal 60, game.score_with_multipliers('aaaaaaaaaa', [1,1,1,1,1,1,1,1,1,1], 3)
  end

  def test_highest_scoring_word_returns_highest_score_word_from_array
    game = Scrabble.new
    assert_equal "home", game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_highest_scoring_word_returns_highest_score_word_with_fewer_tiles_when_tie
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['hello', 'word', 'sound'])
  end

  def test_highest_scoring_word_returns_highest_score_word_with_seven_letters_when_tie
    game = Scrabble.new
    assert_equal "silence", game.highest_scoring_word(['home', 'word', 'silence'])
  end

  def test_highest_scoring_word_returns_first_highest_score_word_with_fewer_tiles_when_tie
    game = Scrabble.new
    assert_equal "word", game.highest_scoring_word(['hi', 'word', 'ward'])
    assert_equal "esilenc", game.highest_scoring_word(['esilenc', 'word', 'silence'])
  end

end
