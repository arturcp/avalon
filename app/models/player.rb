class Player
  attr_accessor :name, :character

  def initialize(name)
    @name = name
  end

  def vote
    Dice.roll(0..1)
  end

  def <=>(other)
    name <=> other.name
  end
end
