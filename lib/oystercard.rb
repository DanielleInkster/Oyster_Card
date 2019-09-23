require 'station'

class Oystercard

  attr_reader :balance, :travelling, :stations, :entrance_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @travelling = false
    @stations =[]
  end

  def top_up(amount)
    fail "Exceeds maximum value" if (@balance +amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @travelling = true if @stations.includes? @entrance_station
  end

  def touch_in(station)
    fail "balance too low" if @balance < MINIMUM_BALANCE
    deduct(MINIMUM_BALANCE)
    @stations << station
    @travelling = true
    @entrance_station = station
  end

  def touch_out
    @travelling = false
  end

  private
    
    def deduct(amount)
      @balance -= amount
    end

end
