require 'pry'
require './lib/scrabble'

s = Scrabble.new

binding.pry




def translate(word)
  @word = word

  @word.split('').map do |letter|
  letter = @alpha_to_binary[@word]
  letter.join('')
  end
end
