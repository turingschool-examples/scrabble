class WordFinder
  def words
    File.read('/usr/share/dict/words').split("\n")
  end

  def includes?(word)
    words.include?(word)
  end
end
