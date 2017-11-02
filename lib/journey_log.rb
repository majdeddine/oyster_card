
class JourneyLog
  attr_reader :history, :jclass
  def initialize(jclass: Journey )
    @history = []
    @jclass = jclass
  end

  def start(station)
    @j = @jclass.new
    @j.entry_station = station

  end

  def finish(station)
   @j.exit_station = station
   add_journey(@j)
  end
  def add_journey(journey)
    @history << @j.current_journey
  end
end
