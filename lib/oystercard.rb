require'station'
require 'journey'

class Oystercard

  attr_accessor :balance, :journeys,  :exit_station, :journey, :travelling

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey = Journey.new
    @journeys = []
    @travelling = false
  end

  def top_up(amount)
    fail "Exceeds maximum value" if (@balance +amount) > MAXIMUM_BALANCE
    @balance += amount
  end
 
  def touch_in(station)
    fail "Balance too low" if @balance < MINIMUM_BALANCE
    @journey = Journey.new
    @journey.entry_station = station
    @travelling = true
  end

  def touch_out(station)
    deduct(MINIMUM_BALANCE)
    @journey.exit_station = station
    make_journey
    end_journey
  end

  private

    def make_journey
      journey = {
        :entry_station => @journey.entry_station,
        :exit_station => @journey.exit_station,
      }
      @journeys.push(journey)
    end

    def end_journey
      @entry_station = nil
      @exit_station = nil
      @travelling = false
    end

    def deduct(amount)
      @balance -= amount
    end

end
