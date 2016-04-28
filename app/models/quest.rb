class Quest
  attr_reader :party_size, :status

  PENDING_STATUS = 'pending'
  SUCCESS_STATUS = 'success'
  FAILURE_STATUS = 'failure'

  def initialize(party_size = 5)
    @party_size = party_size
    @status = PENDING_STATUS
  end

  def end_with_success
    @status = SUCCESS_STATUS
  end

  def end_with_failure
    @status = FAILURE_STATUS
  end

  def succeeded?
    status == SUCCESS_STATUS
  end

  def failed?
    status == FAILURE_STATUS
  end
end
