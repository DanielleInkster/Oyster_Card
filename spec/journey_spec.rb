require 'journey'

describe Journey do
  it 'exists!' do
   expect(subject.class).to eq Journey
  end

  describe "#in_journey?" do
    it 'starts off false' do
      expect(subject.in_journey?).to eq nil
    end
  end
end