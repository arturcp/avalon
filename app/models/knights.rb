class Knights
  def initialize(knights)
    @knights = knights
  end

  def embark_on_a_quest(quest)
    points = @knights.reduce(0) { |sum, knight| sum += knight.vote }

    if points == @knights.length
      puts 'A missão falhou'.red
      quest.end_with_success
    else
      puts 'A missão foi bem sucedida'.green
      quest.end_with_failure
    end
  end
end
