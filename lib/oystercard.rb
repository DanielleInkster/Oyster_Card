require 'station'

class Oystercard

  attr_reader :balance, :stations, :entrance_station
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @stations =[]
  end

  def top_up(amount)
    fail "Exceeds maximum value" if (@balance +amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def in_journey?
    @travelling = true if @entrance_station
  end

  def touch_in(station)
    fail "balance too low" if @balance < MINIMUM_BALANCE
    deduct(MINIMUM_BALANCE)
    @stations << station
    @entrance_station = station
  end

  def touch_out
    @entrance_station = nil
  end

  private

    def deduct(amount)
      @balance -= amount
    end

end
