require_relative 'oystercard'
class Journey

  attr_accessor :entry_station, :exit_station, :fare

  PENALTY_FARE = 6

  def initialize(entry = nil)
    @entry_station = entry
  end

  def finish(station)
    @exit_station = station
    self
  end

    def fare
     penalty? ? (Oystercard::MINIMUM_BALANCE): PENALTY_CHARGE
    end

  private

  def penalty?
    (!entry_station || !exit_station) 
  end
end