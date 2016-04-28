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
end
