class Oystercard

  attr_reader :balance, :travelling
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @travelling = false
  end

  def top_up(amount)
    fail "Exceeds maximum value" if (@balance +amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @travelling
  end

  def touch_in
    fail "balance too low" if @balance < MINIMUM_BALANCE
    deduct(MINIMUM_BALANCE)
    @travelling = true
  end

  def touch_out
    @travelling = false
  end

  private
    
    def deduct(amount)
      @balance -= amount
    end

end
