require 'rails_helper'

describe Quest do
  describe '#succeeded?' do
    it 'returns true if the quest succeeded' do
      allow_any_instance_of(Quest).to receive(:status).and_return(Quest::SUCCESS_STATUS)
      expect(subject.succeeded?).to eq(true)
    end

    it 'returns false if the quest failed' do
      allow_any_instance_of(Quest).to receive(:status).and_return(Quest::FAILURE_STATUS)
      expect(subject.succeeded?).to eq(false)
    end
  end

  describe '#failed?' do
    it 'returns false if the quest succeeded' do
      allow_any_instance_of(Quest).to receive(:status).and_return(Quest::SUCCESS_STATUS)
      expect(subject.failed?).to eq(false)
    end

    it 'returns true if the quest failed' do
      allow_any_instance_of(Quest).to receive(:status).and_return(Quest::FAILURE_STATUS)
      expect(subject.failed?).to eq(true)
    end
  end

  describe '#end_with_success' do
    it 'returns true if the quest succeeded' do
      subject.end_with_success
      expect(subject.succeeded?).to eq(true)
    end

    it 'returns false if the quest failed' do
      subject.end_with_failure
      expect(subject.succeeded?).to eq(false)
    end
  end

  describe '#end_with_failure' do
    it 'returns false if the quest succeeded' do
      subject.end_with_success
      expect(subject.failed?).to eq(false)
    end

    it 'returns true if the quest failed' do
      subject.end_with_failure
      expect(subject.failed?).to eq(true)
    end
  end
end
