gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    # skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_multiple_letters
    assert_equal 5, Scrabble.new.score("cat")
    assert_equal 6, Scrabble.new.score("dogs")
    assert_equal 14, Scrabble.new.score("scrabble")
  end
end
