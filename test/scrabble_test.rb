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

  def test_it_can_score_with_multipliers
    game = Scrabble.new
    assert_equal 9, game.score_with_multipliers('hello', [1,2,1,1,1])
    require 'pry';binding.pry
  end
end
