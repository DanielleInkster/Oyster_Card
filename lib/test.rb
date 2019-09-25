require_relative "oystercard"

oystercard = Oystercard.new
station = Station.new('Aldgate','2')

oystercard.top_up(20)

puts oystercard.balance

oystercard.touch_in(station)
oystercard.touch_in(station)

puts oystercard.balance
