gem 'minitest'
require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_initializes
    game = Scrabble.new

    assert_instance_of Scrabble, game
  end

  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score('a')
    assert_equal 4, Scrabble.new.score('f')
  end

  def test_scoring_works_with_empty_string
    assert_equal 0, Scrabble.new.score('')
  end

  def test_score_works_with_nil
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_score_works_for_full_word
    assert_equal 7, Scrabble.new.score('Adam')
    assert_equal 14, Scrabble.new.score('miCHael')
    assert_equal 18, Scrabble.new.score('TuringSchool')
  end

  def test_letter_multipliers
    assert_equal 9, Scrabble.new.score_with_multipliers('Adam', [1,2,1,1])
    assert_equal 16, Scrabble.new.score_with_multipliers('miCHael', [1,2,1,1,2,1,1])
    assert_equal 24, Scrabble.new.score_with_multipliers('TuringSchool', [1,2,1,1,2,1,1,2,1,1,2,1])
  end

  def test_word_multipler
    assert_equal 18, Scrabble.new.score_with_multipliers('Adam', [1,2,1,1], 2)
    assert_equal 48, Scrabble.new.score_with_multipliers('miCHael', [1,2,1,1,2,1,1], 3)
    assert_equal 120, Scrabble.new.score_with_multipliers('TuringSchool', [1,2,1,1,2,1,1,2,1,1,2,1], 5)
  end
end
