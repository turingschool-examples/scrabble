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
end
