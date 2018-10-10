require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_exits
    game = Scrabble.new
    assert_instance_of Scrabble, game
  end

  def test_it_can_score_a_single_letter
    # skip
    game = Scrabble.new
    # binding.pry
    assert_equal 1, Scrabble.new.score("a")
    # assert_equal 4, Scrabble.new.score("f")
    # binding.pry
  end
end
