class Journey

attr_reader :entry_station, :exit_station
  def initialize
    @entry_station = 'none'
    @exit_station = 'none'
  end

  def save_journey(entry, exit)
    @entry_station = entry
    @exit_station = exit
    current_journey
  end

  def current_journey
    { entry: entry_station, exit: exit_station }
  end

end
