require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter #test_1
    skip
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_a_word #test_2
    skip
    assert_equal 8, Scrabble.new.score("hello")
  end

  def test_it_returns_zero #test_3: needs work
    
      assert_equal 0, Scrabble.new.score(nil)
  end



end
