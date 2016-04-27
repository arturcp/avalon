class Quest
  PENDING_STATUS = 'pending'
  SUCCESS_STATUS = 'success'
  FAILURE_STATUS = 'failure'

  def initialize(party_size)
    @party_size = party_size
    @status = PENDING_STATUS
  end

  def end_with_success
    @status = SUCCESS_STATUS
  end

  def end_with_failure
    @status = FAILURE_STATUS
  end

  def succeded?
    @status == SUCCESS_STATUS
  end

  def failed?
    @status == FAILURE_STATUS
  end
end
