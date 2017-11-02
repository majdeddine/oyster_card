require 'journey_log'
describe JourneyLog do
  let(:journey) {double :journey}
  
  describe '#history' do
    it 'should be an array' do
      expect(subject.history).to be_instance_of Array
    end
  end
  # describe '#add_journey' do
  #   it 'should receive a hash as argument' do
  #     expect(subject).to receive(:add_journey).with(1)
  #   end
    it 'should add journey to the history variable' do
      subject.add_journey(journey)
      expect(subject.history).to eq [journey]
  end
end
