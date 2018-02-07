gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1,Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_can_score_a_word
    game = Scrabble.new
    message = "hello"
    assert_equal = game("hello"), Scrabble.new
  end

end
