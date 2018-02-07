class Scrabble
  attr_reader :point_values

  def initialize
    @score = 0
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


  def score(word)
    if word == nil
      @score
    elsif word == ""
      @score
    else
    word_array = word.upcase.chars
    word = word_array.map do |char|
      @point_values[char]
    end
    @score = word.sum
    # binding.pry
    end
  end

  # def score_with_multipliers(input)
  #   hash_1 = Hash.new[keys.zip(values)]
  #   common_keys = hash1.keys & hash2.keys
  #   multiply = []
  #   common_keys.map do |key|
  #   multiply << hash1[key] * hash2[key]
  #   end
  # end
  # #   # iterate over input[0] to get corresponding point_values
  # #   #create new array of corresponding point values
  # #   # - zip input to hash => hash = Hash.new[keys.zip(values)]
  # #   #multiply hash values?
  # #   # - or use  @point_values.keep_if , .select, .each_key,
  # #   #   .each_value

end
