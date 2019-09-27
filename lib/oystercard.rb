require_relative 'station'
require_relative 'journey'

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
    if travelling == true
      deduct(@journey.fare)
      end_journey
    end
    @journey.entry_station = station
    @travelling = true
  end

  def touch_out(station)
    @journey.exit_station = station
    deduct(@journey.fare)
    make_journey
    end_journey
    puts @journeys
  end

  private

    def make_journey
      trip = {
        :entry_station => @journey.entry_station,
        :exit_station => @journey.exit_station,
      }
      @journeys.push(trip)
    end

    def end_journey
      @journey.entry_station = nil
      @journey.exit_station = nil
      @travelling = false
    end

    def deduct(amount)
      @balance -= amount
    end

end
