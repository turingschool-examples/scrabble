class WordFinder
  attr_reader :dictionary

  def initialize
    @dictionary = words
  end

  def words
    File.read('/usr/share/dict/words').upcase.split("\n")
  end

  def exists?(word)
    @dictionary.include?(word.upcase)
  end
end
