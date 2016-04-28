class Game
  attr_reader :players

  ALIGNMENT_PROPORTION = {
    5 =>  { good: 3, evil: 2 },
    6 =>  { good: 4, evil: 2 },
    7 =>  { good: 4, evil: 3 },
    8 =>  { good: 5, evil: 3 },
    9 =>  { good: 6, evil: 3 },
    10 => { good: 6, evil: 4 }
  }

  def initialize(players)
    @players = players
    # TODO: Consider creating a custom error class
    raise 'The game needs from 5 to 10 players' if invalid_players_count?

    @quests = Quests.new(players.count)
    assign_roles
  end

  def good_team
    @players.select { |player| player.character.good? }
  end

  def evil_team
    @players.select { |player| player.character.good? }
  end

  def merlin
    @players.select { |player| player.is_a? Characters::Merlin }
  end

  def assassin
    @players.select { |player| player.is_a? Characters::Assassin }
  end

  private

  def invalid_players_count?
    players.count > 10 || players.count < 5
  end

  def assign_roles
    players.each do |player|
      player.character = random_character(roles)
    end
  end

  def roles
    @roles ||= begin
      valid_roles = [Characters::Merlin.new, Characters::Assassin.new]
      alignment_proportion = ALIGNMENT_PROPORTION[players.count]

      # Includes good generic characters to fill the good characters capacity
      (alignment_proportion[:good] - 1).times { |_| valid_roles << Characters::LoyalServantOfArthur.new }

      # Includes evil generic characters to fill the evil characters capacity
      (alignment_proportion[:evil] - 1).times { |_| valid_roles << Characters::MinionOfMordred.new }

      valid_roles
    end
  end

  def random_character(roles)
    chosen = rand(0..roles.length)
    roles.delete(chosen)
  end
end
