class Oystercard

attr_reader :balance, :journeys

MAXIMUM_BALANCE = 90
MINIMUM_CHARGE = 3

  def initialize
    @balance = 0
    @journeys = []
    @current_journey = nil
  end

  def top_up(amount)
    fail "Cannot top-up more than #{MAXIMUM_BALANCE}" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end


  def in_journey?
    !!@current_journey
  end

  def touch_in(entry_station)
    fail "You need to top-up first" if @balance < 1
    @current_journey = Journey.new(entry_station)
  end

  def touch_out(exit_station)
    @current_journey.finish(exit_station)
    deduct(@current_journey.fare)
    @journeys << {in: @current_journey.entry_station, out: @current_journey.exit_station}
    @current_journey = nil
  end

private 

  def deduct(fare = MINIMUM_CHARGE)
    @balance -= fare
  end

end

