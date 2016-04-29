module Characters
  class Assassin < Character
    def initialize
      @name = 'Assassin'
      @alignment = Character::EVIL_ALIGNMENT
    end

    def guessed_who_is_merlin?(players)
      index = rand(0..players.length - 1)

      players[index].character.is_a? Characters::Merlin
    end
  end
end
