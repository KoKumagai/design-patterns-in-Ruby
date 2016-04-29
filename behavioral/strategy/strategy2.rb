# Context
class PaymentSystem
  attr_accessor :payment

  def initialize(amount, &payment)
    @amount = amount
    @payment = payment
  end

  def pay
    @payment.call(@amount)
  end
end


############### Usage ###############
# ConcreteStrategy1
cash = -> (amount) do
  puts "You paid $#{amount} by cash."
end

payment_system = PaymentSystem.new(100, &cash)
payment_system.pay
#=> You paid $100 by cash.


# ConcreteStrategy2
credit_card = -> (amount) do
  puts "You paid $#{amount} by credit card."
end

payment_system = PaymentSystem.new(300, &credit_card)
payment_system.pay
#=> You paid $300 by credit card.