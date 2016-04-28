require 'rails_helper'

describe Game do
  describe 'Players count' do
    it 'raises an exception if there are not at least 5 players in the game' do
      expect { Game.new([Player.new('Chiquitão')]) }.to raise_error(StandardError)
    end
  end

  describe 'Assigning roles' do
    xit 'ensures all players have a role' do
      game = Game.new([Player.new('Chiquitão'), Player.new('John'), Player.new('Doe'), Player.new('Jane'), Player.new('Roe'), Player.new('Mariah')])

      (1..6).each do |index|
        expect(game.players[index].character).not_to be_nil
      end
    end

    xit 'assigns all roles to the players' do
    end
  end
end
