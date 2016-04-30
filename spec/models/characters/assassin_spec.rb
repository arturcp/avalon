require 'rails_helper'

describe Characters::Assassin do
  describe '#good?' do
    it 'responds with false' do
      expect(subject.good?).to be(false)
    end
  end

  describe '#evil?' do
    it 'responds with true' do
      expect(subject.evil?).to be(true)
    end
  end

  describe '#guessed_who_is_merlin?' do
    it 'is false when the assassin does not know who the Merlin is' do
      allow(Dice).to receive(:roll).and_return(0)
      expect(subject.guessed_who_is_merlin?([build(:player, :assassin)])).to eq false
    end

    it 'is tue when the assassin knows who the Merlin is' do
      allow(Dice).to receive(:roll).and_return(0)
      expect(subject.guessed_who_is_merlin?([build(:player, :merlin)])).to eq true
    end
  end
end
