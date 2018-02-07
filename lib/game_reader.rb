require_relative 'scrabble'
require_relative 'player'

class GameReader
  def initialize(filename)
    @players = []

    lines = File.read(filename).split('/n')
    lines.shift
    lines.each do |line|

    end
  end
end
