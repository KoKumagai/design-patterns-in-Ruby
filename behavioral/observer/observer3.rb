require 'observer'

class Email
  attr_accessor :from, :to, :title, :message 
  
  def initialize(from, to, title, message)
    @from = from
    @to = to
    @title = title
    @message = message
  end

  def send
    puts "From: #{@from}"
    puts "To: #{@to}"
    puts "Title: #{@title}"
    puts "Message: #{@message}"
  end
end

# Observer
class Person
  include Observable

  attr_accessor :name

  def initialize(name)
      @name = name
  end

  def send_email(email)
    email.send
    changed
    notify_observers(self)
  end
end

# ConcreteObserver
class Alert
  def update(person)
    puts "Alert: #{person.name} sent an email"
  end
end


############### Usage ###############
ko = Person.new("Ko")
ko.add_observer(Alert.new)
ko.send_email(Email.new("Ko", "Matz", "The Ruby", "I love Ruby"))
#=> From: Ko
#=> To: Matz
#=> Title: The Ruby
#=> Message: I love Ruby
#=> Alert: Ko sent an email