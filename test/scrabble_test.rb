require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
  end

  def test_it_can_score_an_empty_string
    assert_equal 0, Scrabble.new.score("")
  end
  
  def test_it_can_score_nil
    assert_equal 0, Scrabble.new.score(nil)
  end
    
  def test_it_can_score_with_multipliers
    assert_equal 9, Scrabble.new.score('hello', [1,2,1,1,1])
  end
  
  def test_it_can_score_with_doubler
    assert_equal 18, Scrabble.new.score('hello', [1,2,1,1,1], 2)
  end
  
  def test_it_can_find_highest_scoring_word
    assert_equal "home", Scrabble.new..highest_scoring_word(['home', 'word', 'hello', 'sound'])
  end
end
