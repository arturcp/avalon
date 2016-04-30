require 'rails_helper'

describe Game do
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

    it 'raises an exception if there are not at least 5 players in the game' do
      expect { Game.new([build(:player)]) }.to raise_error(StandardError)
    end
  end

  context 'when spliting the teams accorgin to the alignment' do
    let(:player_with_merlin) { build(:player) }
    let(:player_with_assassin) { build(:player) }
    let(:player_with_loyal1) { build(:player) }
    let(:player_with_loyal2) { build(:player) }
    let(:player_with_minion) { build(:player) }

    let(:game) do
      Game.new([
        player_with_merlin,
        player_with_assassin,
        player_with_loyal1,
        player_with_loyal2,
        player_with_minion
      ])
    end

    before do
      allow(player_with_merlin).to receive(:character).and_return(build(:merlin))
      allow(player_with_assassin).to receive(:character).and_return(build(:assassin))
      allow(player_with_loyal1).to receive(:character).and_return(build(:loyal))
      allow(player_with_loyal2).to receive(:character).and_return(build(:loyal))
      allow(player_with_minion).to receive(:character).and_return(build(:minion))
    end

    describe '#good_team' do
      it 'lists the players with good alignment characters' do
        expect(game.good_team).to include(player_with_merlin, player_with_loyal1, player_with_loyal2)
      end

      it 'does not list the players with evil alignment characters' do
        expect(game.good_team).not_to include(player_with_assassin, player_with_minion)
      end
    end

    describe '#evil_team' do
      it 'lists the players with evil alignment characters' do
        expect(game.evil_team).to include(player_with_assassin, player_with_minion)
      end

      it 'does not list the players with good alignment characters' do
        expect(game.evil_team).not_to include(player_with_merlin, player_with_loyal1, player_with_loyal2)
      end
    end

    describe '#merlin' do
      it 'finds the player playing with the Merlin character' do
        expect(game.merlin).to eq(player_with_merlin)
      end
    end

    describe '#assassin' do
      it 'finds the player playing with the Assassin character' do
        expect(game.assassin).to eq(player_with_assassin)
      end
    end
  end
end
