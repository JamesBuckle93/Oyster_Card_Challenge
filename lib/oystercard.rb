class Oystercard
  attr_reader :balance, :in_journey, :MIN_FARE, :entry_station, :exit_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 1
  
  def initialize(balance = 0)
    @balance = balance
    # @in_journey = false
  end

  def top_up(amount)
    fail "Max balance exceeded" unless @balance + amount <= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
    # @in_journey
  end

  def touch_in(station)
    fail "insufficient balance" if balance < MIN_BALANCE
    @entry_station = station
    # @in_journey = true 
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @exit_station = station
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end