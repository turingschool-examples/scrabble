gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exists
    scrabble = Scrabble.new("a")
    assert_instance_of Scrabble, scrabble
  end

  def test_it_can_score_a_single_letter
    scrabble = Scrabble.new("a")
    assert_equal 1, scrabble.score("a")
    scrabble_1 = Scrabble.new("f")
    assert_equal 4, scrabble.score("f")
    scrabble_2 = Scrabble.new("")
    assert_equal 0, scrabble.score("")
    scrabble_3 = Scrabble.new("*")
    assert_equal nil, scrabble.score("*")

  end
end
