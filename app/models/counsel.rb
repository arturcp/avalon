class Counsel
  attr_reader :counselors

  def initialize(counselors)
    @counselors = counselors
  end

  def accept_party?
    votes = counselors.reduce(0) { |sum, counselor| sum += counselor.vote }
    votes > counselors.count / 2
  end
end
