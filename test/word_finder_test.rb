gem 'minitest'
require_relative '../lib/word_finder'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordFinderTest < Minitest::Test
  def test_word_is_valid
    word_finder_1 = WordFinder.new

    assert word_finder_1.includes?("hello")
  end

  def test_word_is_invalid
    word_finder_1 = WordFinder.new

    refute word_finder_1.includes?("olleh")
  end
end
