require "oystercard"

describe Oystercard do

  it "is an Oystercard object" do
    expect(subject.class).to eq Oystercard
  end

  it "card starts with a balance of zero" do
    expect(subject.balance).to eq 0
  end





end
