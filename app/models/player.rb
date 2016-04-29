class Player
  attr_accessor :name, :character

  def initialize(name)
    @name = name
  end

  def vote
    rand(0..1)
  end

  def <=>(other)
    name <=> other.name
  end
end
