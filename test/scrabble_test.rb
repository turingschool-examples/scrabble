gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def test_scrabble_object_exists
    scrabble = Scrabble.new

    assert_instance_of Scrabble, scrabble

  end

  def test_it_can_score_a_single_letter
    scrabble = Scrabble.new

    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word
    scrabble = Scrabble.new

    assert_equal 9, scrabble.word_score("help")
  end


end
