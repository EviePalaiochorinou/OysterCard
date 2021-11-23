class Oystercard

attr_reader :balance, :in_journey

MAXIMUM_BALANCE = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "Cannot top-up more than #{MAXIMUM_BALANCE}" if (@balance + amount) > MAXIMUM_BALANCE
    @balance += amount
  end

  def deduct(fare)
    @balance -= fare
  end

  def in_journey?
    @in_journey = in_journey
  end

def touch_in
  fail "You need to top-up first" if @balance < 1
  @in_journey = true
end

def touch_out
  @in_journey = false

end



  
end

