gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    game = Scrabble.new
    assert_equal 1, game.score("a")
    assert_equal 4, game.score("f")
  end

  def test_it_can_format_a_word
    game = Scrabble.new
    assert_equal ["H","E","L","L","O"], game.format_word("hello")
  end

  def test_it_can_score_a_word
    game = Scrabble.new
    assert_equal 8, game.score("hello")
    assert_equal 16, game.score("Chocolate")
  end

  def test_it_can_score_an_empty_string
    game = Scrabble.new
    assert_equal 0, game.score("")
  end

  def test_it_can_score_nil
    game = Scrabble.new
    assert_equal 0, game.score(nil)
  end
end
