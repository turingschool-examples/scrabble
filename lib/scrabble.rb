class Scrabble

  attr_reader :score

  def initialize
    @score = score
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

  def score(element)
    #binding.pry

    if element != nil
    e = element.upcase
      if e.length == 1
        point_values[e]
      elsif e.length >= 2
        w = e.split(//).to_a
        new_array = w.map do |letter|
          point_values[letter]
        end
        #binding.pry
        sum = 0
        int_array = new_array.map(&:to_i)
        sum = int_array.inject(:+)
      end
    elsif element = nil
      0
    end
  end

end 



end
