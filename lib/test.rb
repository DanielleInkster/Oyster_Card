require_relative "oystercard"

oystercard = Oystercard.new
station = Station.new('Aldgate','2')
station2 = Station.new('Moorgate', '1')

oystercard.top_up(20)

puts oystercard.balance

oystercard.touch_in(station)
oystercard.touch_out(station2)


puts oystercard.balance
puts @journeys
