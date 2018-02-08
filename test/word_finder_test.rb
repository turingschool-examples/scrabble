gem 'minitest'
require_relative '../lib/word_finder'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class WordFinderTest < Minitest::Test

  def setup
    @finder = WordFinder.new
  end

  def test_dictionary_read_in
    assert_equal 235_886, @finder.dictionary.count
  end

  def test_can_find_word
    assert @finder.exists?('hello')
  end

  def test_doesnt_find_non_word
    refute @finder.exists?('helloo')
  end

end
