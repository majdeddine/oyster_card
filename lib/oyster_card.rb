class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    raise "this will go over the limit #{DEFAULT_LIMIT}" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end
end
