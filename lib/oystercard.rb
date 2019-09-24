require_relative 'station'

class Oystercard

  attr_reader :balance, :journeys, :entrance_station, :exit_station, :journey
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journeys = []
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
    @entrance_station = station
  end

  def touch_out(station)
    @exit_station = station
    make_journey
    end_journey
  end

  private

    def make_journey
      @journey = {
        :entrance_station => entrance_station,
        :exit_station => exit_station,
      }
      @journeys.push(journey)
    end

    def end_journey
      @entrance_station = nil
      @exit_station = nil
    end

    def deduct(amount)
      @balance -= amount
    end

end
