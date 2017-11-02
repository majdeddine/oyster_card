class Journey

attr_accessor :entry_station, :exit_station


  # def save_journey(entry, exit)
  #   @entry_station = entry
  #   @exit_station = exit
  #   current_journey
  # end

  def current_journey
    { entry: entry_station, exit: exit_station }
  end

end
