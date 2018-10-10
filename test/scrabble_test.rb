require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    Scrabble.new.score("a")
    Scrabble.new.score("f")
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_if_no_word_score_is_0
    Scrabble.new.score("")

    assert_equal 0, Scrabble.new.score("")
  end
  # binding.pry
end
