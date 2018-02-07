gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1,Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f,h")
  end

  def test_can_score_a_word
    game = Scrabble.new
    word = "hello"
    assert_equal = game.score(word), "hello",length

  end

  def test_can_score_an_empty_string
    game = Scrabble.new
    assert_euqal = word is
  end

  def test_can_score_nil
    game = Scrabble.new""
    assert_nil nil, game.

  end


end
