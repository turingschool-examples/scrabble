require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_handle_words_varing_caps
    assert_equal 4, Scrabble.new.score("Test")
    assert_equal 10, Scrabble.new.score("WANTED")
  end

  def test_if_it_can_handle_multipliers
    without = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
    with = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 9, without
    assert_equal 18, with
  end

  def test_if_seven_letter_bonus_works
    long = Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    short = Scrabble.new.score_with_multipliers('ent', [1,2,1], 2)
    assert_equal 58, long
    assert_equal 8, short
  end
end
