require_relative 'journey_log'
require_relative 'journey'
class OysterCard
  DEFAULT_BALANCE = 0
  DEFAULT_LIMIT = 90
  MINIMUM_LIMIT= 1
  attr_reader :balance, :entry_station, :journey_log

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @entry_station = nil
    #@history = []
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    top_up_error?(amount)
    @balance += amount
  end

  def touch_in(station='none')
    # touch_in_error?
  @journey_log.start(station)
  end

  def touch_out(station='none')
    # touch_out_error?
    @journey_log.finish(station)
    # @journey_log.add(@journey.current_journey)
    # @journey_log.add_journey(save_journey(station))
    # fare
  end

  def show_history
    @journey_log.history
  end

  #
  # def fare
  #   @journey_log.history.last.has_value?('none') ? deduct(6*MINIMUM_LIMIT) : deduct(MINIMUM_LIMIT)
  # end

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
    # raise('card already in use') if in_journey?
  end

  def touch_out_error?
    raise('card did not touch in') unless in_journey?
  end

  def save_journey(station)
  @journey.save_journey(@entry_station, station)
    #@history << {entry: @entry_station, exit: station
  end
end
