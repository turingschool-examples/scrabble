require 'pry'

class Scrabble

  def score(string, multi = nil, double = nil)
    bonus = 0
    scores = point_values
    if string == "" || string == nil
      return 0
    end
    
    if string.length > 7
      bonus = 10
    end
    
    if multi && double
      return multiply_string(string, multi) * double + bonus
    elsif multi
      return multiply_string(string, multi) + bonus
    else
      final_score = 0
      string.split('').each do |letter|
        final_score += scores[letter.upcase]
      end
      final_score
    end
  end
  
  def multiply_string(string, multi)
    final_score = 0
    scores = point_values
    string.split('').each_with_index do |letter, index|
      final_score += scores[letter.upcase] * multi[index]
    end

    final_score
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
end
