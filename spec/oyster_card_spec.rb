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

    it 'raise error if the amount would push the balance over the limit' do
      card.top_up(90)
      message = "this will go over the limit #{OysterCard::DEFAULT_LIMIT}"
      expect { card.top_up(1) }.to raise_error(message)
    end
  end
end
