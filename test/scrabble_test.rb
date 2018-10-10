require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_it_exists
    assert_instance_of Scrabble, Scrabble.new
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end
  def test_it_can_score_a_complete_word
    assert_equal 8, Scrabble.new.score("Hello")
  end
  def test_it_can_score_nil_word
    assert_equal 0, Scrabble.new.score(nil)
  end
  def test_it_can_score_empty_string
    assert_equal 0, Scrabble.new.score("")
  end

end
