require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup
    @scrabble = Scrabble.new
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, @scrabble.score("a")
    assert_equal 4, @scrabble.score("f")
  end

  def test_it_can_score_a_word_with_no_multipliers
    assert_equal 8, @scrabble.score("hello")
  end
end
