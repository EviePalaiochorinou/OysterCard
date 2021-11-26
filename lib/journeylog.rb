class JourneyLog

  def initialize
    @journeys = []
    @current_journey = nil
  end

  def start(entry_station)
    @current_journey = Journey.new(entry_station)
  end

  def finish(exit_station)
    @journeys << {in: @current_journey.entry_station, out: @current_journey.exit_station}
  end

  private 

  def current_journey

  end

end