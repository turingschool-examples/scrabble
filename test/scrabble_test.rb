require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    Scrabble.new.score("a")
    Scrabble.new.score("f")
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_whole_word
    Scrabble.new.score("hello")
    Scrabble.new.score("taco")
    assert_equal 8, Scrabble.new.score("hello")
    assert_equal 6, Scrabble.new.score("taco")
  end

  def test_if_no_word_score_is_0
    Scrabble.new.score("")

    assert_equal 0, Scrabble.new.score("")
  end

  def test_if_return_is_nil_score_0
    skip
    Scrabble.new.score(nil)

    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_if_score_mulitpler_works
    game = Scrabble.new
    game.score_with_multipliers('hello', [1,2,1,1,1])
    game.score_with_multipliers('hello', [1,2,1,1,1], 2)

    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
    assert_equal 18, game.score_with_multipliers('hello', [1,2,1,1,1], 2)
  end
  # binding.pry
end
