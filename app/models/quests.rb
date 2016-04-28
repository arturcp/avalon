class Quests
  attr_reader :players_count

  PARTY_SIZE = {
    5 =>  [2, 3, 2, 3, 3],
    6 =>  [2, 3, 4, 3, 4],
    7 =>  [2, 3, 3, 4, 4],
    8 =>  [3, 4, 4, 5, 5],
    9 =>  [3, 4, 4, 5, 5],
    10 => [3, 4, 4, 5, 5]
  }

  def initialize(players_count)
    @players_count = players_count
    @current_quest = -1

    initialize_quest_list
  end

  def end?
    success_count > 2 || failure_count > 2 || @current_quest > 4
  end

  def next_quest
    @current_quest += 1
    @quests[@current_quest]
  end

  private

  def initialize_quest_list
    @quests = (1..5).map do |quest_number|
      Quest.new(party_size(quest_number))
    end
  end

  def party_size(quest_number)
    PARTY_SIZE[players_count][quest_number - 1]
  end

  def success_count
    @quests.reduce(0) { |sum, quest| sum += quest.succeeded? ? 1 : 0 }
  end

  def failure_count
    @quests.reduce(0) { |sum, quest| sum += quest.failed? ? 1 : 0 }
  end
end
