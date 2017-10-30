require 'oyster_card'

describe OysterCard do
  subject(:card) { described_class.new }

  it 'return default balance' do
    expect(card.balance).to eq(0)
  end
end
