class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_LIMIT= 1
  attr_reader :balance, :entry_station, :history

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
    @history = []
    @journey = Journey.new
  end

  def top_up(amount)
    top_up_error?(amount)
    @balance += amount
  end

  def touch_in(station)
    touch_in_error?
    @entry_station = station

  end

  def touch_out(station)
    touch_out_error?
    deduct(MINIMUM_LIMIT)
    save_journey(station)
    @entry_station = nil
  end

private

  def limit?(amount)
    @balance + amount > DEFAULT_LIMIT
  end


  def sufficent_money?
    balance > MINIMUM_LIMIT
  end

  def in_journey?
    @entry_station
  end

  def deduct(amount)
    @balance -= amount
  end

  def top_up_error?(amount)
    raise "this will go over the limit #{DEFAULT_LIMIT}" if limit?(amount)
  end

  def touch_in_error?
    raise ('insufficent balance on the card') unless sufficent_money?
    raise('card already in use') if in_journey?
  end

  def touch_out_error?
    raise('card did not touch in') unless in_journey?
  end

  def save_journey(station)
    @history << @journey.save_journey(@entry_station, station)
    #@history << {entry: @entry_station, exit: station
  end
end
