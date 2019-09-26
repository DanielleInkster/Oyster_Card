require 'journey'

describe Journey do
  it 'exists!' do
   expect(subject.class).to eq Journey
  end

  it 'stores a journey' do
    card = Oystercard.new
    card.top_up(50)
    card.touch_in(:station)
    card.touch_out(:station)
    expect(card.journeys).to include({:entry_station=>:station, :exit_station=>:station})
  end
end