require_relative 'oystercard'
class Journey

  attr_accessor :entry_station, :exit_station, :fare

  PENALTY_FARE = 6

  def initialize(entry = nil)
    @entry_station = entry
    @exit_station = nil
  end

  def finish(station)
    @exit_station = station
  end

    def fare
      puts penalty?
     penalty? ?  PENALTY_FARE : (Oystercard::MINIMUM_BALANCE) 
    end

  private

  def penalty?
    @entry_station == nil || @exit_station == nil
  end
end