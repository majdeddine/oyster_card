require 'oyster_card'

describe OysterCard do
  subject(:card) { described_class.new }

  describe 'balance' do
    it 'return default balance' do
      expect(card.balance).to eq(0)
    end
  end

  describe 'top_up' do
    it 'should add the specified amount onto the balance' do
      card.top_up(5)
      expect(card.balance).to eq(5)
    end
  end
end
