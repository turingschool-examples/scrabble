require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_with_multipliers
    word = Scrabble.new('hello', [1,2,1,1,1])

    assert_equal 9, scrabble.score_with_multipliers

  end
end
