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

  describe "#in_journey?" do
    it 'starts off false' do
      expect(subject.in_journey?).to eq nil
    end
  end

  describe '#touch_in' do

    it "touch in activates the journey " do
      subject.top_up(50)
      subject.touch_in(:station)
      expect(subject.in_journey?).to eq true
    end

    it 'stores the station when you touch in' do
      subject.top_up(50)
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.journeys).to eq [ {:entrance_station => :station,:exit_station => :station} ]
    end

    it "touching in deducts the minimum value" do
      subject.top_up(50)
      expect{subject.touch_in(:station)}.to change{subject.balance}.by(-Oystercard::MINIMUM_BALANCE)
    end

    it "throws and error if you try and touch in with an amount less than 1" do
      message = "balance too low"
      expect{subject.touch_in(:station)}.to raise_error message
    end

  end

  describe '#touch_out' do
    it "touch out stops the journey " do
      subject.top_up(50)
      subject.touch_in(:station)
      subject.touch_out(:station)
      expect(subject.in_journey?).to eq nil
    end
  end





end
