gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    assert_equal 10, Scrabble.new.score("alpha")
    assert_equal 10, Scrabble.new.score("forget")
  end

  def test_it_can_score_an_empty_string
    assert_equal 10, Scrabble.new.score("alpha")
    assert_equal 10, Scrabble.new.score("forget")
  end
end
