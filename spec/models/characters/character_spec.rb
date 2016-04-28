require 'rails_helper'

describe Characters::Character do
  it { is_expected.to respond_to :good? }
  it { is_expected.to respond_to :evil? }
end
