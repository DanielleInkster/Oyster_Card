require "oystercard"

describe Oystercard do

  it "is an Oystercard object" do
    expect(subject.class).to eq Oystercard
  end

  it "card starts with a balance of zero" do
    expect(subject.balance).to eq 0
  end

  it "can be topped up" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it 'has an empty list of journeys when initialized' do
    expect(subject.journeys).to eq []
  end

  describe '#top_up' do
    it "has a maximum value" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      message = "Exceeds maximum value"
      expect{ subject.top_up(maximum_balance+1) }.to raise_error message
    end
  end

  # describe "#deduct" do
  #   it "deducts from the balance" do
  #     subject.top_up(10)
  #     subject.deduct(5)
  #     expect(subject.balance).to eq 5
  #   end
  # end

  describe '#touch_in' do

    it "touch in activates the journey " do
      subject.top_up(50)
      subject.touch_in(:station)
      expect(subject.travelling).to eq true
    end

    it "throws and error if you try and touch in with an amount less than 1" do
      message = "Balance too low"
      expect{subject.touch_in(:station)}.to raise_error message
    end

    it "touching in twice deducts the penalty fare" do
      subject.top_up(50)
      subject.touch_in(:station)
      expect{subject.touch_in(:station)}.to change{subject.balance}.by(-Journey::PENALTY_FARE)
    end
  end

  describe '#touch_out' do
    it "touch out stops the journey " do
      subject.top_up(50)
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.travelling).to eq false
    end

    it "touching out deducts the minimum value" do
      subject.top_up(50)
      subject.touch_in(:station)
      expect{subject.touch_out(:station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_BALANCE)
    end

    it "touching out twice deducts the penalty fare" do
      subject.top_up(50)
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect{subject.touch_out(:station)}.to change{subject.balance}.by(-Journey::PENALTY_FARE)
    end

    # it 'stores a journey' do
    #   subject.top_up(50)
    #   subject.touch_in(:station)
    #   subject.touch_out(:station)
    #   expect(subject.journeys).to include({:entrance_station=>:station, :exit_station=>:station})
    # end
  end
end
