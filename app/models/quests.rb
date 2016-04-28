class Quests
  attr_reader :players_count

  PARTY_SIZE = {
    5:  [2, 3, 2, 3, 3],
    6:  [2, 3, 4, 3, 4],
    7:  [2, 3, 3, 4, 4],
    8:  [3, 4, 4, 5, 5],
    9:  [3, 4, 4, 5, 5],
    10: [3, 4, 4, 5, 5]
  }

  def initialize(players_count)
    @players_count = players_count
    @current_quest = 0

    initialize_quest_list
  end

  def end?
    success_count > 2 || failure_count > 2 || @current_quest > 5
  end

  private

  def initialize_quest_list
    @quests = (1..5).map do |quest_number|
      Quest.new(party_size(quest_number))
    end
  end

  def party_size(quest_number)
    PARTY_SIZE[players_count][mission_number - 1]
  end

  def success_count
    @quests.reduce(0) { |quest| quest.succeed? 1 : 0 }
  end

  def failure_count
    @quests.reduce(0) { |quest| quest.failed? 1 : 0 }
  end
end