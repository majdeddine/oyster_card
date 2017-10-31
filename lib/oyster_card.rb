class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_LIMIT= 1
  attr_reader :balance, :in_use, :entry_station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_use = false
    @entry_station = nil
  end

  def top_up(amount)
    raise "this will go over the limit #{DEFAULT_LIMIT}" if limit?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise ('insufficent balance on the card') unless sufficent_money?
    raise('card already in use') if in_journey?
    @entry_station = station
    @in_use = true
  end

  def touch_out
    raise('card did not touch in') unless in_journey?
    deduct(MINIMUM_LIMIT)
    @entry_station = nil
    @in_use = false
  end

private

  def limit?(amount)
    @balance + amount > DEFAULT_LIMIT
  end


  def sufficent_money?
    balance > MINIMUM_LIMIT
  end

  def in_journey?
    @in_use
  end

  def deduct(amount)
    @balance -= amount
  end
end
