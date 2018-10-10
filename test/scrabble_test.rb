require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def setup; end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score('a')
    assert_equal 4, Scrabble.new.score('f')
  end

  def test_it_can_score_actual_words
    assert_equal 5, Scrabble.new.score('anten')
    assert_equal 15, Scrabble.new.score('skrabec')
    assert_equal 8, Scrabble.new.score('hello')
  end

  def test_capitalization_doesnt_matter
    assert_equal Scrabble.new.score('anten'), Scrabble.new.score('anten'.upcase)
  end

  def test_score_returns_zero_when_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_score_returns_zero_when_empty
    assert_equal 0, Scrabble.new.score('')
  end
end
