class Scrabble
# attr_accessor :point_values
  def initialize
    @point_values = {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  #
  def score(letter_string)
    # letter_string.upcase! #change letter_string to upcase
    #need to return value from point_values hash!
    letter_string.map do |letter|
      @point_values[letter]
      letter.upcase!
      letter.to_i
      #number needs to be i, not string

    end

  end
  #
  #
  # end



end


# def score(point_values)
#   point_values.upcase!
#   @point_values[value]
#
# end
#
# def score
#   point_values.each do |letter, number|
#     number << letter.upcase
#   end


# def score(letter_string)
#   x = letter_string.upcase!
#
#   x.map do |letter, number|
#     @point_values [number]
#
#     # point_values
#     # letter.to_i
#   end
#   # binding.pry
