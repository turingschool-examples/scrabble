require './lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score('a')
    assert_equal 4, Scrabble.new.score('f')
  end

  def test_it_can_score_a_word
    assert_equal 8, Scrabble.new.score('hello')
  end

  def test_it_can_score_an_empty_string
    assert_equal 0, Scrabble.new.score('')
  end

  def test_it_can_score_when_someone_passes_nil
    assert_equal 0, Scrabble.new.score('nil')
  end

  def test_it_can_score_a_word_with_letter_multipliers; end

  def test_its_can_score_word_with_a_word_multiplier; end

  def test_it_can_score_a_word_with_a_seven_letter_bonus; end
end
