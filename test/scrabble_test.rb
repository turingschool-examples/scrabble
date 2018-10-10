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
    assert_equal 9, Scrabble.new.score("world")
  end

  def test_it_can_score_a_word_with_mults
    assert_equal 16, Scrabble.new.score("hello",{mults:{W:2}})
    assert_equal 27, Scrabble.new.score("world",{mults:{W:3}})

    assert_equal 12, Scrabble.new.score("hello",{mults:{DL:[0]}})
    assert_equal 13, Scrabble.new.score("hello",{mults:{DL:[0,4]}})
    assert_equal 16, Scrabble.new.score("hello",{mults:{TL:[0]}})
    assert_equal 26, Scrabble.new.score("hello",{mults:{DL:[0,4], W:2}})
  end

  def test_it_can_score_a_7_letter_word
    assert_equal 69, Scrabble.new.score("amazing")

    # assert_equal 88, Scrabble.new.score("amazing", 2)
  end
end
