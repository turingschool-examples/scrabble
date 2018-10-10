require_relative '../lib/scrabble'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class ScrabbleTest < Minitest::Test
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabble.new.score("a")
    assert_equal 4, Scrabble.new.score("f")
    assert_equal 0, Scrabble.new.score("")
    assert_equal 0, Scrabble.new.score(nil)
  end

  def test_it_can_handle_words_varing_caps
    assert_equal 4, Scrabble.new.score("Test")
    assert_equal 10, Scrabble.new.score("WANTED")
  end

  def test_if_it_can_handle_multipliers
    without = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1])
    with = Scrabble.new.score_with_multipliers('hello', [1,2,1,1,1], 2)
    assert_equal 9, without
    assert_equal 18, with
  end

  def test_if_seven_letter_bonus_works
    long = Scrabble.new.score_with_multipliers('sparkle', [1,2,1,3,1,2,1], 2)
    short = Scrabble.new.score_with_multipliers('ent', [1,2,1], 2)
    assert_equal 58, long
    assert_equal 8, short
  end
end


#Psuedo coding highest scoring word

#method takes in 3 seperate strings in array
#feed strings into conversions to get values and compare
#Highest value wins - print out that word

#Restraints - If there is a tie the shortest word wins
#If a word is seven letters long it automatically wins (+10 bonus)

#If the words are the same length and score pick the first one in the array.

# def highest_scoring_word(array)
#   get their values, include the bonus for 7+ (maybe zip into orig array?)
#   compare values
#   return the winner
#   if values are tied determine winner by shortest length val1 > val2
#     return winner
#   if word is 7 chars
#       return word
#
#   if words are same length and value go up array and pick first in list
#   end
