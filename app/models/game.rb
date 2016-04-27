class Game
  def initialize(players)
    @players = players
    @quests = Quests.new(players.count)

    assign_roles
  end

  def good_team
  end

  def evil_team
  end

  def merlin
  end

  def persival
  end

  private

  def assign_roles
    valid_roles = [Merlin.new, Assassin.new]

    # roles = RoleFactory.valid_roles
  end
end
