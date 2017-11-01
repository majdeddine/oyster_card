require 'station'

describe Station do
  station = Station.new('al', 1)
  it '.name return station name' do
    expect(station.name).to eq('al')
  end

  it '.zone return station zone' do
    expect(station.zone).to eq(1)
  end
end
