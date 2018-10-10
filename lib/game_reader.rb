class GameReader
  attr_reader :filename
  def initialize(filename)
    @filename = filename
  end

  def word_count(player)
    File.open(@filename).each do |line|

    end

  end

end
