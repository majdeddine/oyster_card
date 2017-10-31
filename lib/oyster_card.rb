class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_LIMIT= 1
  attr_reader :balance, :in_use

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    raise "this will go over the limit #{DEFAULT_LIMIT}" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in
    raise ('insufficent balance on the card') unless sufficent_money?
    raise('card already in use') if in_journey?
    @in_use = true
  end

  def touch_out
    raise('card did not touch in') unless in_journey?
    deduct(MINIMUM_LIMIT)
    @in_use = false
  end

private

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
