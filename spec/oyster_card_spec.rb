require 'oyster_card'

describe OysterCard do
  subject(:card) { described_class.new }

  describe 'attributes' do
    it '.balance return default balance' do
      expect(card.balance).to eq(OysterCard::DEFAULT_BALANCE)
    end

    it 'Checking .in_use is set to false by default' do
      expect(card.in_use).to eq false
    end
  end

  describe '#top_up' do
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

  describe '#deduct' do
    it 'should deduct the specified amount from balance' do
      card.top_up(10)
      card.deduct(2)
      expect(card.balance).to eq(8)
    end
  end

  describe '#touch_in' do
    it 'return true' do
      expect(card.touch_in).to eq(true)
    end
  end

  describe '#touch_out' do
    it 'return false' do
      expect(card.touch_out).to eq(false)
    end
  end
end
