class Player
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def number
    @name[-1].to_i
  end


end
