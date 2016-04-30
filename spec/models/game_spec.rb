require 'rails_helper'

describe Game do
  describe 'Players count' do
    it 'raises an exception if there are not at least 5 players in the game' do
      expect { Game.new([build(:player)]) }.to raise_error(StandardError)
    end
  end

  describe '.new' do
    let(:players) do
      [
        Player.new('Chiquitão'),
        Player.new('John'),
        Player.new('Doe'),
        Player.new('Jane'),
        Player.new('Roe'),
        Player.new('Mariah')
      ]
    end

    let(:game) { Game.new(players) }

    it 'ensures all players have a role' do
      (0..5).each do |index|
        expect(game.players[index].character).not_to be_nil
      end
    end

    it 'shuffles the players by default' do
      expect(game.players).not_to eq(players)
    end

    it 'does not shuffle the players if it is explicitly required' do
      game = Game.new(players, false)
      expect(game.players).to eq(players)
    end
  end
end
