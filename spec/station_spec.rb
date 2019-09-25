require 'station'

describe Station do

  it 'exists!' do
    expect(Station.new(:name, :zone).class).to eq Station
  end

  let(:place) {Station.new('Aldgate', '2')}

  it 'has a name' do
    expect(place.name.empty?).to eq false
  end

  it 'has a zone' do
    expect(place.zone.empty?).to eq false
  end
end
