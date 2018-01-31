class Player
  attr_reader :name, :lives

  def initialize(name)
    @name = name
    @lives = 6
  end

  def guess(letter)
    return letter
  end
end
