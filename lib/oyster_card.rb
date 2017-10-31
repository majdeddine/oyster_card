class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  attr_reader :balance, :in_use

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    raise "this will go over the limit #{DEFAULT_LIMIT}" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

private

  def in_journey?
    @in_use
  end
end
