# Strategy
class Payment
  def pay(amount)
    raise raise NotImplementedError, "You should implement #{self.class}##{__method__}"
  end
end

# ConcreteStrategy1
class Cash < Payment
  def pay(amount)
    puts "You paid $#{amount} by cash."
  end
end

# ConcreteStrategy2
class CreditCard < Payment
  def pay(amount)
    puts "You paid $#{amount} by credit card."
  end
end

# Context
class PaymentSystem
  attr_accessor :payment

  def initialize(amount, payment)
    @amount = amount
    @payment = payment
  end

  def pay
    @payment.pay(@amount)
  end
end


############### Usage ###############
payment_system = PaymentSystem.new(100, Cash.new)
payment_system.pay
#=> You paid $100 by cash.

payment_system = PaymentSystem.new(300, CreditCard.new)
payment_system.pay
#=> You paid $300 by credit card.