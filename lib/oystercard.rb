class Oystercard
  attr_reader :balance
  CARD_LIMIT = 90

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    fail "The limit is #{CARD_LIMIT}, you can not add more money to your oystercard!" if exceeds_limit?(amount)
    @balance += amount 
  end

  def deduct(fare)
    @balance -= fare
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

  private

  def exceeds_limit?(amount)
    @balance + amount > CARD_LIMIT
  end
end