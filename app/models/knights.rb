class Knights
  def initialize(knights)
    @knights = knights
  end

  def embark_on_a_quest(quest)
    points = @knights.reduce(0) do |sum, knight|
      sum += knight.character.good? ? good_vote : evil_vote
    end

    if points == @knights.length
      puts 'A missão foi bem sucedida'.green
      quest.end_with_success
    else
      puts 'A missão falhou'.red
      quest.end_with_failure
    end
  end

  private

  def good_vote
    1
  end

  # For now, evil has a 50% of change of bluffing
  # this is for balancing the result of the missions
  def evil_vote
    Dice.roll(0..1)
  end
end
