require_relative 'station'
require_relative 'journey'

class Oystercard

  attr_accessor :balance, :journeys, :entrance_station, :exit_station, :journey, :travelling
  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journeys = []
    @travelling = false
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
    @travelling = true
  end

  def touch_out(station)
    @exit_station = station
    make_journey
    end_journey
  end

  private

    def penalty_fare_out
      raise "Haven\'t touched in" if @travelling == false 
      @balance -= PENALTY_FARE
    end

    def penalty_fare_in
      raise "Haven't touched out" if @travelling == true 
      @balance -= PENALTY_FARE
    end


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
      @travelling = false
    end

    def deduct(amount)
      @balance -= amount
    end

end
