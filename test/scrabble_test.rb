gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exists
    scrabble = Scrabble.new
    assert_instance_of Scrabble, scrabble
  end

  def test_it_has_letters
    scrabble = Scrabble.new
    assert "a", scrabble.point_values
  end
  def test_it_can_score_a_single_letter
    # skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    scrabble = Scrabble.new
    assert_equal 8, scrabble.score("hello")
  end

  def test_it_can_score_a_space
    scrabble = Scrabble.new
    assert_equal 0, scrabble.score(" ")
  end

  def test_it_can_score_nil
    scrabble = Scrabble.new
    assert_equal 0, scrabble.score(nil)
  end

  def test_it_can_score_a_phrase
    scrabble = Scrabble.new
    assert_equal 17, scrabble.score("hello world")
  end

  def test_it_can_multiply_scores
    scrabble = Scrabble.new
    assert_equal 9, scrabble.score_with_multipliers('hello', [1,2,1,1,1])
  end
end
