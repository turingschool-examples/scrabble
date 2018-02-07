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
    assert_equal 8, Scrabble.new.score("hello")
  end

  def test_it_can_score_an_empty_string
    assert_equal 0, Scrabble.new.score("")
  end

  def test_it_can_score_when_someone_passes_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  # def test_it_can_score_a_word_with_letter_multipliers
  #   assert_equal 9, Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
  # end
  #
  # def test_it_can_score_a_word_with_word_multipliers
  #
  # end
end
