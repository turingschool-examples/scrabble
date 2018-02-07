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

  def test_score_with_multipliers

  end
end
