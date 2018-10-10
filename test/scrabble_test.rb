require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup
    @game = Scrabble.new
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    assert_equal 8, @game.score("hello")
  end

  def test_it_can_score_empty_string
    assert_equal 0, @game.score("")
  end

  def test_it_can_score_nil
    assert_equal 0, @game.score(nil)
  end

  def test_it_can_use_multipliers
    assert_equal 9, @game.score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_it_can_use_double_word_score
    assert_equal 18, @game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end

  def test_it_can_score_seven_letter_bonus
    assert_equal 58, @game.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
  end

  def test_it_can_choose_highest_scoring_word
    assert_equal "home", @game.highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end

  def test_it_can_choose_highest_scoring_word_with_fewest_tiles
    assert_equal "word", @game.highest_scoring_word(['hello', 'word', 'sound'])
  end

  def test_it_can_choose_highest_scoring_word_with_seven_letters
    assert_equal "silence", @game.highest_scoring_word(['home', 'word', 'silence'])
  end

  def test_it_can_pick_first_in_list_if_equal_high_scores
    assert_equal "word", @game.highest_scoring_word(['hi', 'word', 'ward'])
  end



end
