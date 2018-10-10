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

  def test_it_can_score_space
  assert_equal 0, Scrabble.new.score("")
  end
end



# > game = Scrabble.new
# => ...
# > game.score("hello")
# => 8
# > game.score("")
# => 0
# > game.score(nil)
# => 0
