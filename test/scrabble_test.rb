require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test

  def setup
    @game = Scrabble.new
  end

  def test_it_exists
    assert_instance_of Scrabble, @game
  end

  def test_it_can_score_a_single_letter
     assert_equal 1, @game.score("a")
     assert_equal 4, @game.score("f")
  end


end
