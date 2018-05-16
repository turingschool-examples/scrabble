gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exists
    new_game = Scrabble.new
    assert_instance_of Scrabble, new_game
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_multiletter_word
    new_game = Scrabble.new
    assert_equal 8, new_game.score("hello")
    assert_equal 14, new_game.score("john")
  end

  def test_it_can_score_zero
    new_game = Scrabble.new
    assert_equal 0, new_game.score("")
  end

  def it_can_score_nil
    new_game = Scrabble.new
    assert_equal nil, new_game.score(nil)
  end
  
end
