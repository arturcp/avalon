require 'rails_helper'

describe Characters::LoyalServantOfArthur do
  describe '#good?' do
    it 'responds with true' do
      expect(subject.good?).to be(true)
    end
  end

  describe '#evil?' do
    it 'responds with false' do
      expect(subject.evil?).to be(false)
    end
  end
end
