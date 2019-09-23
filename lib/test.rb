require_relative "oystercard"

oystercard = Oystercard.new

oystercard.top_up(10)

puts oystercard.balance

oystercard.touch_in
oystercard.touch_out
