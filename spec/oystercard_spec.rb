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

  describe '#top_up' do
    it "has a maximum value" do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      expect{ subject.top_up(maximum_balance+1) }.to raise_error
    end
  end






end
