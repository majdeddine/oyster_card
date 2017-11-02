require 'oyster_card'

describe OysterCard do

  subject(:card) { described_class.new }

  let(:card_with_money) { described_class.new(5)}

  let(:station)  { double :station }

  let(:exit_station)  { double :station }
  describe 'attributes' do
    it '.balance return default balance' do
      expect(card.balance).to eq(OysterCard::DEFAULT_BALANCE)
    end

    it '.history return an array by default' do
      expect(card.history).to eq([])
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

  describe '#touch_in' do

     it 'Raise error if insufficent funds' do
        expect {card.touch_in(station)}.to raise_error 'insufficent balance on the card'
     end
    it 'raise error if card is already in use' do
      card_with_money.touch_in(station)
      expect { card_with_money.touch_in(station) }.to raise_error("card already in use")
    end
    it 'Remember the entry station on touch in' do
      card_with_money.touch_in(station)
      expect(card_with_money.entry_station).to eq(station)

    end
  end

  describe '#touch_out' do

    it 'raise error if card is not in use' do
      expect { card.touch_out(exit_station) }.to raise_error('card did not touch in')
    end

    it 'deduct the balance by minimum fare' do
      card_with_money.touch_in(station)
      expect {card_with_money.touch_out(exit_station)}.to change{card_with_money.balance}.by(-OysterCard::MINIMUM_LIMIT)
    end
    it 'Forget the entry station on touch out' do
      card_with_money.touch_in(station)
      card_with_money.touch_out(exit_station)
      expect(card_with_money.entry_station).to eq(nil)
    end
    it 'add hash to history' do
      card_with_money.touch_in(station)
      card_with_money.touch_out(exit_station)
      expect(card_with_money.history).to eq([{entry: station , exit: exit_station}])
    end
  end

  describe '#fare' do
    it 'deduct a fare of 6 when missing entry or exit station' do
      card_with_money.touch_in(station)
      expect{card_with_money.touch_out}.to change{card_with_money.balance}.by(-6*OysterCard::MINIMUM_LIMIT)
    end
  end

end
