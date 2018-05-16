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

  def test_it_recieves_word
    word_array = Scrabble.new.score("hello")
    assert_equal "h", word_array[0]
  end

  def test_can_recognize_nill
    guess_word = Scrabble.new.take_word(" ")
    assert_equal 0, guess_word
  end

  def test_it_can_assign_point_values
    word = Scrabble.new.asssign_point_values("HELLO")
    assert_equal word, 8
  end

  end
