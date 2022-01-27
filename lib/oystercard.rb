class Oystercard
  attr_reader :balance, :in_journey, :MIN_FARE, :entry_station, :exit_station, :journeys

  MAX_BALANCE = 90
  MIN_FARE = 1
  
  def initialize(balance = 0)
    @balance = balance
    @journeys = {}
  end

  def top_up(amount)
    fail "Max balance exceeded" unless @balance + amount <= MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    !!entry_station
  end

  def touch_in(station)
    fail "insufficient balance" if balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journeys.merge!(entry_station: @entry_station, exit_station: station)
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end