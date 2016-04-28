class GameSimulation
  def self.start
    players = [
      Player.new('Bruno'),
      Player.new('Artur'),
      Player.new('Thiago'),
      Player.new('Fred'),
      Player.new('Thais'),
      Player.new('Hissao')
    ]

    game = Game.new(players)
    game.start
  end
end
