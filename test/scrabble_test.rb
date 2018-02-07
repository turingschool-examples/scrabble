gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
    assert_equal 2, Scrabble.new.score("G")
    assert_equal 10, Scrabble.new.score("z")
  end

  def test_it_can_score_a_multiple_letters
    assert_equal 2, Scrabble.new.score("eo")
    assert_equal 7, Scrabble.new.score("kio")
  end

  def test_score_with_multipliers
    assert_equal 9, score_with_multipliers('hello', [1,2,1,1,1])
  end

  def test_score_with_multipliers_bounus
    skip
    assert_equal 58, score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)


  end
end
