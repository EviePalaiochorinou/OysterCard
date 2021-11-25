class Oystercard

attr_reader :balance, :in_journey, :entry_station

MAXIMUM_BALANCE = 90
MINIMUM_CHARGE = 3

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot top-up more than #{MAXIMUM_BALANCE}" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end


  def in_journey?
    !!@entry_station
  end

  def touch_in(entry_station)
    fail "You need to top-up first" if @balance < 1
    @entry_station = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
  end

private 

  def deduct(fare = MINIMUM_CHARGE)
    @balance -= fare
  end

  
end

