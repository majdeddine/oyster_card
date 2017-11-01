require 'journey'

describe Journey do

subject(:journey){described_class.new}
let(:station1) {double :station}
let(:station2) {double :station}
  describe 'attributes' do
    it '.entry_station return a default value "none"' do
      expect(journey.entry_station).to eq('none')
    end

    it '.exit_station return a default value "none"' do
      expect(journey.exit_station).to eq('none')
    end
  end

  describe '#save_journey' do
    it 'accept two arguments' do
      expect(journey).to respond_to(:save_journey).with(2)
    end

    it 'save .entry_station' do
      journey.save_journey(station1, station2)
      expect(journey.entry_station).to eq(station1)
    end

    it 'save .exit_station' do
      journey.save_journey(station1, station2)
      expect(journey.exit_station).to eq(station2)
    end
  end

  describe '#current_journey' do
    it 'return a hash' do
      journey.save_journey(station1, station2)
      return_value = {entry: station1, exit: station2}
      expect(journey.current_journey).to eq(return_value)
    end
  end

end
