require 'oystercard'
class Journey

  attr_accessor :entry_station, :exit_station

  PENALTY_FARE = 6

  def initialize(entry = nil)
    @entry_station = entry
  end

  def finish(station)
    @exit_station = station
    self
  end
end