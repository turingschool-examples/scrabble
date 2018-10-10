class Game

  def score_with_multipliers(element, double = [])
    e = element.upcase
      if e.length == 1
        point_values[e]
      elsif e.length >= 2
        w = e.split(//).to_a
        new_array = w.map do |letter|
          point_values[letter]
        end
        binding.pry
        product = 0
        int_array = new_array.map(&:to_i)
        multiplier = double.map do |double|
          product *= int_array
        end
      end 
    end
end
